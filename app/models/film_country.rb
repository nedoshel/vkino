class FilmCountry < ActiveRecord::Base
  belongs_to :film
  belongs_to :country
end
