class BulkinsertsController < ApplicationController
  def new
    # Showing the form of input
  end

  def create
    # Save Users
    employee_params.each do |employee_param|
      Employee.create(employee_param)
    end
    redirect_to new_bulkinsert_path
  end

  private

  def employee_params
    # Whitelisting the parameters
    params.require(:employees).map do |employee_param|
      employee_param.permit(:firstname, :lastname, :department_id, :country_id, :salary)
    end
  end
end