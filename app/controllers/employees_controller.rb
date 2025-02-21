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

  # def index
  # end 

  # def home
  # end

  # def session_test
  #   session[:emp_id] = 123
  #   session[:salary] = 1000
  #   session[:is_active] = true
  #   session[:emp_name] = "John"
  # end

  # def readsessiondata
  #   # session.delete(:emp_id)
  #   # session.clear # clear all session data
  #   # reset_session # reset session id
  
  # end

  #  For Cookies State Management Technique
  # This action sets various types of cookies:
  # 
  # 1. Plain Text Cookie:
  #    - `cookies[:emp_name] = "Hey! I am a Plain Text Cookie"`
  #    - This is a simple cookie stored as plain text.
  # 
  # 2. Expiring Cookie:
  #    - `cookies[:exp_kookies] = { value: "John Lenard", expires: Time.now + 2.minutes }`
  #    - This cookie has an expiration time set to 2 minutes from the current time.
  # 
  # 3. Signed Cookie:
  #    - `cookies.signed[:user_id] = "Hey! I can be decoded, but can't be modified as a cryptographically signed cookie"`
  #    - This cookie is signed to ensure its integrity. It can be read but not tampered with.
  # 
  # 4. Encrypted Cookie:
  #    - `cookies.encrypted[:credit_card] = "Hey! I can't be decoded nor can be modified as I am an encrypted cookie"`
  #    - This cookie is encrypted, providing both confidentiality and integrity. It cannot be read or modified.
  
  def emp_idx
    # Plain Text, Signed, Encrypted
    cookies[:emp_name] = "Hey! I am a Plain Text Cookie"
    cookies[:exp_kookies] = { value: "John Lenard", expires: Time.now + 2.minutes }
    cookies.signed[:user_id] = "Hey! I can be decoded, but can't be modified as a cryptographically signed cookie"
    cookies.encrypted[:credit_card] = "Hey! I can't be decoded nor can be modified as I am an encrypted cookie"
  end

  def home

  end
end
# user_id
# eyJfcmFpbHMiOnsibWVzc2FnZSI6IklraGxlU0VnU1NCallXNGdZbVVnWkdWamIyUmxaQ3dnWW5WMElHTmhiaWQwSUdKbElHMXZaR2xtYVdWa0lHRnpJR0VnWTNKNWNIUnZaM0poY0docFkyRnNiSGtnYzJsbmJtVmtJR052YjJ0cFpTST0iLCJleHAiOm51bGwsInB1ciI6ImNvb2tpZS51c2VyX2lkIn19--ddd2f80ddc6dd882ec422d6c2a3c4b97a6971ff0
# Ccard
#  iN0X8IyYebfx5IdN0N9xuFQIjE7hkPvbEM3y1FvGnUA8ad8gpHbA7QWMq7kGBwiKGf5gDFjvndZ9%2FM4fbnVX2LTsCE%2B5o5KbGH3Woow3cEfgcSFQ%2B9XyFKOT63z8im%2FDVg0spy1DDbws0Rir8aZ3MpvTmSqexD9W%2BGHirmUZpCc%2BJpvGEur0oCvKahntB2QvxWhGIzM0LHVcIW37s8KmRVIeqQ%3D%3D--B2vS1whMC5SPjlA9--rnXDKSI9My1lJ3CtYkRjlg%3D%3D