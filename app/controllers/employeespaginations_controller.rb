class EmployeespaginationsController < ApplicationController

  def index
  #Pagination
  # @employees = Employee.all
  # @employees = Employee.page(params[:page])
  # @employees = Employee.page(params[:page]).per(5)

  # @employees = Employee.page(params[:page]).per(params[:per_page] || 5)

   @employees = Employee.search(params[:search]).page(params[:page]).per(params[:per_page] || 5)
  end
end
