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
      upload_file(params[:photo], folder_path, "#{folder_name}_my_pic")

      certificate_path = Rails.public_path.join('employee_files', folder_name, 'certificate')
      FileUnits.mkdir_p(certificate_path) unless File.directory?(certificate_path)

      params[:employee][:employeecertificates_attributes].each_with_index do |certificate, index|
        upload_file(certificate[:certificate], certificate_path, "#{folder_name}_certificate_#{index+1}")
      end
      
      @employee.update(certificate_params)
      redirect_to employeeinfodetails_path

    end
  end

  def show
    @employee = Employeeinfo.find_by id: params[:id]
    if @employee.present?
      # @foler_name = "#{@employee[:emp_id]}_#{@employee[:lastname]}"
      # @folder_path = Rails.public_path.join('employee_files', @folder_name)
      # file_list = Dir["#{@folder_path}/*"]

      # cv_file_name = file_list.find { |file| file.include?('cv')}.split('/').last
      # my_pic_file_name = file_list.find { |file| file.include?('my_pic')}.split('/').last
      # @cv_file_path = 'employee_files/' + @folder_name + '/' + cv_file_name
      # @my_pic_file_path = 'employee_files/' + @folder_name + '/' + my_pic_file_name

      # certi_folder_path = Rails.public_path.join('employee_files', @folder_name, 'certifiactes')
      # certi_files = Dir["#{certi_folder_path}/*"]
      # @cerficaites = certi_files.map { |file| 'employee_files/' + @folder_name + '/certificates/' + file.split('/').last }
    end
  end

  private 
  def employee_params
    params.require(:employeeinfo).permit(:firstname, :lastname, :pin_card)
  end

  def upload_file(file, folder_path, file_name)
    file_name = file.original_filename
    file_extension = file_name.split('.').last
    new_file_name = "#{file_name}.#{file_extension}"
    File.open(File.join(folder_path, new_file_name), 'wb') do |f|
      f.write(file.read)
    end
  end

  def certificate_params
    params.require(:employee).permit(employeecertificates_attributes: [:certificate])
  end
end
