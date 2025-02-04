class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :gender
      t.date :birthdate
      t.string :email
      t.string :phone
      t.string :postalcode
      t.string :websiteurl
      t.boolean :termsandconditions
      t.string :role
      t.text :notes

      t.timestamps
    end
  end
end
