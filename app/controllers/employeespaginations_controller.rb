class EmployeespaginationsController < ApplicationController

  def index
  #Pagination
  @employees = Employee.all
  end
end
