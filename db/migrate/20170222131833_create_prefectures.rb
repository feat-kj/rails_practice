class CreatePrefectures < ActiveRecord::Migration[5.0]
  def change
    create_table :prefectures do |t|
      t.text :name
      t.integer :sort

      t.timestamps
    end
  end
end
