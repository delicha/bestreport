class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :kind
      t.string :subject
      t.string :description
      t.string :attendance
      t.string :homework
      t.string :performance
      t.text :minitest
      t.text :comment
      t.text :other
      t.string :credit

      t.timestamps
    end
  end
end
