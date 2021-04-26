class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :kana
      t.string :email, null: false
      t.integer :birthdate, null: false
      t.string :school, null: false
      t.text :memo

      t.timestamps
      t.index :email, unique: true
    end
  end
end
