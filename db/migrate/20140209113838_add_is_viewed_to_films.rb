class AddIsViewedToFilms < ActiveRecord::Migration
  def change
    add_column :films, :is_viewed, :boolean, default: false, after: :duration
  end
end
