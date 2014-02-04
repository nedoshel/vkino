class RemoveColumnFromFilms < ActiveRecord::Migration
  def change
    remove_column :films, :director_id
  end
end
