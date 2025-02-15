class EmployeefiltersController < ApplicationController
  def index
    @employees = Employee.includes(:department, :country)

    if params[:search].present?
      # Filter by search term in firstname or lastname
      @employees = @employees.where("firstname LIKE ? OR lastname LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    # Filter by country if country_id is present
    @employees = @employees.where(country_id: params[:country_id]) if params[:country_id].present?

    # Filter by department if department_id is present
    @employees = @employees.where(department_id: params[:department_id]) if params[:department_id].present?

    # Filter by start date if start_date is present
    @employees = @employees.where("created_at >= ?", params[:start_date]) if params[:start_date].present?

    # Filter by end date if end_date is present
    @employees = @employees.where("created_at <= ?", params[:end_date]) if params[:end_date].present?

    # Filter by salary range if min_salary or max_salary is present
    @employees = @employees.where("salary >= ?", params[:min_salary]) if params[:min_salary].present?
    @employees = @employees.where("salary <= ?", params[:max_salary]) if params[:max_salary].present?
  end
end
