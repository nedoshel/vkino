class ChangeRatingInFilms < ActiveRecord::Migration
  def change
    change_column :films, :rating, :decimal, precision: 8, scale: 2
  end
end
