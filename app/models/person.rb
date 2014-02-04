# Человек

#  :name
#  :profession

class Person < ActiveRecord::Base

  extend Enumerize

  has_many :film_persons, dependent: :destroy
  has_many :films, through: :film_persons

  enumerize :profession, in: [:director, :actor], scope: true

end
