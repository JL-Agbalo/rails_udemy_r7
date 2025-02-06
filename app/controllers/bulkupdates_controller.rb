class BulkupdatesController < ApplicationController

  def index
    @employees = Employee.includes(:department, :country)
  end

  def bulk_update
    params[:employees].each do |id, attributes|
      if id.present?
        @employee = Employee.find(id)
        @employee.update(employee_params(attributes))
      end
    end
    redirect_to bulkupdates_path, notice: 'Employees were successfully updated.'
  end

  private

  def employee_params(attributes)
    attributes.permit(:firstname, :lastname, :department_id, :country_id, :salary)
  end
end