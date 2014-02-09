class RemovePersons < ActiveRecord::Migration
  def change
    drop_table :persons
    drop_table :film_persons

  end
end
