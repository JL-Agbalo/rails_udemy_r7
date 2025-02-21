class AddRoleToAdmin < ActiveRecord::Migration[7.1]
  def change
    add_reference :admins, :role, foreign_key: true, null: false
  end
end
