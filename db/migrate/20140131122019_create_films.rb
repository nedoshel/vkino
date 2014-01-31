class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.integer :year
      t.string :slogan
      t.integer :director_id
      t.integer :budget
      t.float :rating
      t.float :our_rating
      t.integer :duration

      t.timestamps
    end
  end
end
