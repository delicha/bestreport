class AddStudentIdToReports < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM reports;'
    add_reference :reports, :student, null: false, index: true
  end

  def down
    remove_reference :reports, :student, index: true
  end
end