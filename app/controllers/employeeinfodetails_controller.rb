class EmployeeinfodetailsController < ApplicationController
  def index
    @employees = Employeeinfo.all
  end

  def new
    @employee = Employeeinfo.new
  end

  def create
    @employee = Employeeinfo.new(employee_params)
    if @employee.save
      folder_name = "#{@employee[:emp_id]}_#{@employee[:lastname]}"
      folder_path = Rails.root.join('public', 'uploads', folder_name)
      FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

      upload_file(params[:cv], folder_path, "#{folder_name}_cv")
    end
  end

  def show
  end

  private 
  def employee_params
    params.require(:employeeinfo).permit(:firstname, :lastname, :pin_card)
  end
end
