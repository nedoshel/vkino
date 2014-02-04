# encoding: utf-8
module Kinopoisk
  class Movie

    require 'open-uri'
    require 'nokogiri'

    attr_accessor :id, :url

    HEADERS = { "Accept" => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                "Accept-Language" => 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
                'Host' => 'www.kinopoisk.ru',
                'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31'
             }

    def initialize(url, title = nil)
      @id = url.match(/\d+/).to_a.last
      @url = url
    end

    def title
      document.search("//h1[@itemprop='name']")[0].children.text rescue nil
    end

    def author
       document.xpath("//td")[10].elements.children.text rescue nil
    end

    def cast_members
      document.search("//li[@itemprop='actors']").map do |actor|
        actor.children.text
      end.reject{|name| name =='...' || name == nil}
    end

    def countries
      document.xpath("//td")[4].elements.children.text.split(",").map{ |c| c.strip } rescue nil
    end

    def slogan
      document.xpath("//td")[6].children.text rescue nil
    end

    def description
      text = document.search("//div[@itemprop='description']").text rescue nil
    end

    def director
      document.search("//td[@itemprop='director']/a").children.text
    end

    def genres
      document.xpath("//td")[22].elements.
        map{|a| a.children.text}
        .reject{ |g| g == '...' || g == 'слова'} rescue nil
    end

    def duration
      document.search("//td[@id='runtime']").inner_html.strip.to_i
    end

    def poster
      begin
        res = document.xpath("//a[@class='popupBigImage']")[0].attributes["onclick"].value
        res.match(/\'(.*?)\'/)[1]
      rescue
        nil
      end
    end

    def producer
      document.xpath("//td")[12].elements.
        map{|a| a.children.text}
        .reject{ |g| g == '...'} rescue nil
    end

    def rating
      document.search("//span[@class='rating_ball']")[0].text rescue nil
    end

    def thumbnail
      images = document.search("//img[@src*=/images/']").map do |item|
        "http://www.kinopoisk.ru#{item.attributes['src']}"
      end
      images.reject{ |item| item !~ /images\/film\// }.first
    end

    def year
      if (tr = document.search("//table[@class='info ']")).present?
      else
        tr = document.search("//table[@class='info']")
      end
      tr.search("//tr").first.search("//td")[2].elements.xpath("a").children.text.to_i rescue nil
    end

    def budget
      document.search("//td[@class='dollar']").first.elements.xpath("a").children.text.gsub('$','') rescue nil
    end

    private

    def document
      @document ||= Kinopoisk::Movie.find_by_url(@url)
    end

    def self.find_by_url(url)
      begin
        Nokogiri::HTML(open(url, HEADERS))
      rescue
        nil
      end
    end
  end
end