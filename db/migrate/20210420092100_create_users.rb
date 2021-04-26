class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :kana
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :subject

      t.timestamps
      t.index :email, unique: true
    end
  end
end
