# Фильмы

#  :title
#  :year
#  :slogan
#  :director_id
#  :budget
#  :rating
#  :our_rating
#  :duration

class Film < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  scope :has_image, -> { where.not(image: nil) }

  attr_accessor :directors

  has_many :film_countries, dependent: :destroy
  has_many :countries, through: :film_countries
  accepts_nested_attributes_for :countries, allow_destroy: true, reject_if: proc{|att| att[:country_id].blank? }

  has_many :film_persons, dependent: :destroy
  has_many :persons, through: :film_persons, class_name: Person
  accepts_nested_attributes_for :persons, allow_destroy: true, reject_if: proc{|att| att[:person_id].blank? }

  # Просмотры
  has_many :views, as: :viewable, dependent: :destroy

  before_save :set_directors

  def countries_in_words
    countries.map(&:title).join(", ")
  end

  def directors_list
    persons.with_profession(:director).map{ |d| d.name }.join(", ")
  end

  def set_directors
    if directors.present?
      directors.split(",").each do |person|
        exist_person = Person.with_profession(:director).find_by_name(person.strip)
        if exist_person
          film_persons.find_or_initialize_by_person_id(exist_person.id)
        else
          persons.new(name: person.strip, profession: :director)
        end
      end
    end
  end


end
