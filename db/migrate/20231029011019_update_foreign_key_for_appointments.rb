class UpdateForeignKeyForAppointments < ActiveRecord::Migration[7.0]
  def change
    # Rename the column
    rename_column :appointments, :dentists_id, :dentist_id

    # Add new foreign key for the renamed column
    add_foreign_key :appointments, :dentists, column: :dentist_id
  end
end
