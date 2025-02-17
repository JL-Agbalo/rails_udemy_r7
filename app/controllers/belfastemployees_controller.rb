class BelfastemployeesController < ApplicationController
  def index 
    @employees = Belfastemployee.all
  end

  def export_as
    @employees = Belfastemployee.all
    export_service = BelfastemployeeExportService.new(@employees)
    date_time = Time.now.strftime('%Y%m%d_%H%M%S')
    case params[:export_type]
    when 'pdf'
      send_data export_service.to_pdf, filename: "employees_#{date_time}.pdf", type: 'application/pdf', disposition: 'attachment'
    when 'csv'
      send_data export_service.to_csv, filename: "employees_#{date_time}.csv", type: 'text/csv', disposition: 'attachment'
    when 'txt'
      send_data export_service.to_txt, filename: "employees_#{date_time}.txt", type: 'text/plain', disposition: 'attachment'
    when 'xls'
      send_data export_service.to_xls, filename: "employees_#{date_time}.xls", type: 'application/vnd.ms-excel', disposition: 'attachment'
    when 'docx'
      send_data export_service.to_docx, filename: "employees_#{date_time}.docx", type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', disposition: 'attachment'
    else
      redirect_to root_path, alert: 'Invalid export type'
    end 
  end
end