class AddSelectedTimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :selected_time, :string
  end
end
