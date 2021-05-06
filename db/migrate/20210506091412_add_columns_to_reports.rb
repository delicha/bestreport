class AddColumnsToReports < ActiveRecord::Migration[6.0]
  def up
    add_column :reports, :unit_name, :string
    add_column :reports, :page, :string
  end

  def down
    remove_column :reports, :unit_name, :string
    remove_column :reports, :page, :string
  end
end
