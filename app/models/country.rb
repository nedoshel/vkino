# Страна

# title
# code

class Country < ActiveRecord::Base

  has_many :film_countries, dependent: :destroy
  has_many :films, through: :film_countries

  #1;"Албания";"Албания";"Albania";"Albania";8;"AL";"ALB"
  def self.parse_from_csv(filepath="#{Rails.root}/db/countries.csv")
    f = File.read(filepath)
    countries = []
    f.lines.each do |line|
      line = line.split(";")
      countries << { title: eval(line[1].strip), code: eval(line[6].strip) }
    end
    countries = countries.sort{ |x, y | x[:title].mb_chars.downcase <=>  y[:title].mb_chars.downcase}
    countries.each do |country|
      Country.create(country)
    end
  end

end
