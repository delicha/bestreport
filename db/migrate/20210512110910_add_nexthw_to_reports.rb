class AddNexthwToReports < ActiveRecord::Migration[6.0]
  def up
    add_column :reports, :nexthw, :string
  end

  def down
    remove_column :reports, :nexthw, :string
  end
end
