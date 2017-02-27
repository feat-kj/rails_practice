class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :user_auths do |t|
      t.integer :user_id,         :null => false
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps                :null => false
    end
    add_index :user_auths, :user_id, unique: true
    add_index :user_auths, :email, unique: true
  end
end
