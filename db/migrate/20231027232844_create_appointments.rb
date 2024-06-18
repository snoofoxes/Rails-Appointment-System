class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :dentists, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.string :branch
      t.datetime :start_time
      t.datetime :end_time
      t.string :service

      t.timestamps
    end
  end
end
