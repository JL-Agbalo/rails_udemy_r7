class AddStateToCity < ActiveRecord::Migration[7.1]
  def change
    add_reference :cities, :state, null: false, foreign_key: true
  end
end
