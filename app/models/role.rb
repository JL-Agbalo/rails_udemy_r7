class Role < ApplicationRecord
  has_many :admins  
  has_many :permission_roles, dependent: :destroy
  has_many :permissions, through: :permission_roles
  validates :name, presence: true, uniqueness: true

  def select_permissions_ids=(permission_ids)
    self.permissions = Permission.find(permission_ids.reject(&:blank?))
  end

  def permissions_ids
    # Assuming permissions is an association or a method that returns the permissions for the role
    permissions.pluck(:id)
  end
end
