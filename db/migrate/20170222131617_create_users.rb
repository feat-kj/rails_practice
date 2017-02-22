class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :profile
      t.integer :prefecture_id
      t.integer :gender

      t.timestamps
    end
  end
end
