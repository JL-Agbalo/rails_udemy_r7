class ProductPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def view_product?
    # 4 Means can view Product
    admin.super_admin? || admin.role.permissions_ids.(true)
    # admin.super_admin? || admin.role.permissions_ids.include?(4)

  end

  attr_reader :admin

  def initialize(admin, record)
    @admin  = admin
    @record = record
  end

  def create_product?
    # 1 Means can add Product
    admin.super_admin? || admin.role.permissions_ids.include?(1)
  end

  def update_product?
    # 2 Means can update Product
    admin.super_admin? || admin.role.permissions_ids.include?(2)
  end

  def delete_product?
    # 3 Means can delete Product
    admin.super_admin? || admin.role.permissions_ids.include?(3)
  end

  class Scope < ApplicationPolicy::Scope
  end
end
