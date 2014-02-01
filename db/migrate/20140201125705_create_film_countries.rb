class CreateFilmCountries < ActiveRecord::Migration
  def change
    create_table :film_countries do |t|
      t.integer :film_id
      t.integer :country_id

      t.timestamps
    end
  end
end
