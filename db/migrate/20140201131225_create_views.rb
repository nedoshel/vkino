class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :viewable, polymorphic: true, index: true
      t.timestamps
    end
    add_column :films, :views_count, :integer, default: 0
  end
end
