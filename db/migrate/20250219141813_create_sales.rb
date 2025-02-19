class CreateSales < ActiveRecord::Migration[7.1]
  def change
    create_table :sales do |t|
      t.string :monthname
      t.integer :amount

      t.timestamps
    end
  end
end
