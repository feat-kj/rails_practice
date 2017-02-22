class CreateGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :genres do |t|
      t.integer :category_id
      t.text :name
      t.integer :sort

      t.timestamps
    end
  end
end
