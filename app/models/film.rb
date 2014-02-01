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

  has_many :film_countries, dependent: :destroy
  has_many :countries, through: :film_countries
  accepts_nested_attributes_for :countries, allow_destroy: true, reject_if: proc{|att| att[:country_id].blank? }

  # Просмотры
  has_many :views, as: :viewable, dependent: :destroy

  def countries_in_words
    countries.map(&:title).join(", ")
  end

end
