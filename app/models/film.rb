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
  has_many :persons, through: :film_persons
  accepts_nested_attributes_for :persons, allow_destroy: true, reject_if: proc{|att| att[:person_id].blank? }

  # Просмотры
  has_many :views, as: :viewable, dependent: :destroy

  before_save :set_directors

  def countries_in_words
    countries.map(&:title).join(", ")
  end


  def set_directors
    if directors.present?
      directors.split(",").each do |person|
        self.person_ids << if Person.with_profession(:director).find_by_name(person.strip)
          Person.with_profession(:director).find_by_name(person.strip).id
        else
          Person.create(name: person.strip, profession: :director).id
        end
      end
    end
  end

end
