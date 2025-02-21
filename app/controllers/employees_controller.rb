class EmployeesController < ApplicationController
  # def index
  #   @employees = Employee.all
  # end

  # def new
  #   @employee = Employee.new
  # end

  # def create
  #   employee = Employee.new(employee_params)
  #   if employee.save
  #     redirect_to employees_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def show
  #   @employee = Employee.find(params[:id])
  # end

  # def edit
  #   @employee = Employee.find(params[:id])
  # end

  # def update
  #   @employee = Employee.find(params[:id])
  #   if @employee.update(employee_params)
  #     redirect_to employee_path(@employee)
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
    
  # def delete
  #   @employee = Employee.find(params[:id])
  # end

  # def destroy
  #   @employee = Employee.find(params[:id])
  #   @employee.destroy!
  #   redirect_to employees_path
  # end

  # private

  # def employee_params
  #   params.require(:employee).permit(:firstname, :lastname, :phone_number, :haspassport, :salary, :notes, :birthdate, :hiredate, :gender, :department_id, :country_id)
  # end


  # For SEssion Demo Section 30 Sessions - State Management Techniques

  def index
  end 

  def home
  end

  def session_test
    session[:emp_id] = 123
    session[:salary] = 1000
    session[:is_active] = true
    session[:emp_name] = "John"
  end

  def readsessiondata
    session.delete(:emp_id)
    session.clear # clear all session data
    reset_session # reset session id
  
  end
end