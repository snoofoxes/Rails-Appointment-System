class CreateDentists < ActiveRecord::Migration[7.0]
  def change
    create_table :dentists do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :birthdate
      t.integer :phone_number
      t.string :email
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
