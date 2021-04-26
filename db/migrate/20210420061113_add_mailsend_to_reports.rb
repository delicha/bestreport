class AddMailsendToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :mailsend, :boolean, default: false, null: false
  end
end
