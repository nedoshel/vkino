class RenameFilmPeopleTable < ActiveRecord::Migration
  def change
    rename_table :film_people, :film_persons
  end
end
