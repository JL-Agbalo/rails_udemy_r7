# RolesController handles the actions related to the Role model.
# 
# Actions:
# - index: Retrieves all roles and assigns them to @roles.
#
# Note:
# - The before_action :authenticate_admin! ensures that only authenticated admins can access the actions in this controller.
class RolesController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_role, only: [:edit, :update, :destroy, :permissions, :store_permissions]
  before_action :fetch_permissions, only: [:permissions]
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(roles_params)
    if @role.save
      flash[:notice] = "Role Created Successfully."
      redirect_to roles_path
    else
      flash[:notice] = @role.error.full_messages.join(",")
      redirect_to new_role_path
    end
  end

  def edit
  end

  def update
    if @role.update(roles_params)
      flash[:notice] = "Role Updated Successfully."
      redirect_to roles_path
    else
      flash[:notice] = @role.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    if @role.destroy
      flash[:notice] = "Role Deleted Successfully."
    else
      flash[:notice] = @role.errors.full_messages.join(", ")
    end
    redirect_to roles_path
  end

  def find_role
    @role = Role.find_by id: params[:id]
    unless @role
      flash[:notice] = "Role not found!"
      redirect_to roles_path
    end
  end

  def permissions
    @select_permission_ids = @role.permissions.ids
  end

  def fetch_permissions
    @permissions = Permission.all
  end

  def store_permissions
    @role.select_permissions_ids = params[:permission_ids]
    flash[:notice] = "Permissions Updated Successfully."
    redirect_to roles_path
  end


  private

  def roles_params
    params.require(:role).permit(:name)
  end
  
end
