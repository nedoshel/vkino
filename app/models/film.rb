# Фильмы

#  :title
#  :year
#  :slogan
#  :director_id
#  :budget
#  :rating
#  :our_rating
#  :duration
#  :is_viewed

class Film < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  scope :has_image, -> { where.not(image: nil) }

  scope :viewed, -> { where(is_viewed: true) }
  scope :unviewed, -> { where(is_viewed: false) }

  attr_accessor :directors

  # Режиссеры, актеры
  acts_as_taggable_on :directors, :actors

  has_many :film_countries, dependent: :destroy
  has_many :countries, through: :film_countries
  accepts_nested_attributes_for :countries, allow_destroy: true, reject_if: proc{|att| att[:country_id].blank? }

  # Просмотры
  # Пока убираем
  # has_many :views, as: :viewable, dependent: :destroy

  # Уникальное имя по году
  validates :title, uniqueness: { scope: :year }

  def countries_in_words
    countries.map(&:title).join(", ")
  end

end
