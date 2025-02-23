class StaffUsersController < ApplicationController
before_action :authenticate_admin!
before_action :fetch_roles, only: [:new]
  def index
   @staff_user = Admin.staff_user
  end

  def new
    @staff_user = Admin.staff_user.new
  end

  def fetch_roles
    @roles = Role.where.not(id: 1).pluck(:name, :id)
  end

  # TODO LENARD CHECK THE SAVING AND SHOWING OF THE STAFF USER
  def create
    @staff_user = Admin.staff_user.new(staff_user_params)
    if @staff_user.save
      flash[:notice] = "Staff user created successfully"
      redirect_to staff_users_path
    else
      flash[:notice] = @staff_user.error.full_messages.join(",")
      redirect_to new_staff_user_path
    end
  end

  def staff_user_params
    params.require(:staff_user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation, :role_id)
  end
  
end
