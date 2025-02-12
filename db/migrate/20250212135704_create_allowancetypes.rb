class CreateAllowancetypes < ActiveRecord::Migration[7.1]
  def change
    create_table :allowancetypes do |t|
      t.string :name
      t.integer :percentage

      t.timestamps
    end
  end
end
