class CreateOffshoreemployees < ActiveRecord::Migration[7.1]
  def change
    create_table :offshoreemployees do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
