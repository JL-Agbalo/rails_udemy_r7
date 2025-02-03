class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone_number

      t.timestamps
    end
  end
end
