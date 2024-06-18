class RenameUsersIdInAppointments < ActiveRecord::Migration[6.0] # or your specific Rails version
  def change
    rename_column :appointments, :users_id, :user_id
  end
end
