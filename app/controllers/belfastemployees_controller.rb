class BelfastemployeesController < ApplicationController
  def index 
    @employees = Belfastemployee.all
  end

  def export_as
    @employees = Belfastemployee.all
    case params[:export_type]
    when 'pdf'
      export_as_pdf
    when 'csv'
      export_as_csv
    when 'txt'
      export_as_txt
    when 'xls'
      export_as_xls
    when 'docx'
      export_as_docx
    else
      redirect_to root_path, alert: 'Invalid export type'
    end 
  end

  private

  def export_as_pdf
    # Implement PDF export logic here
    render plain: "Exporting as PDF"
  end

  def export_as_csv
    # Implement CSV export logic here
    render plain: "Exporting as CSV"
  end

  def export_as_txt
    # Implement TXT export logic here
    render plain: "Exporting as TXT"
  end

  def export_as_xls
    # Implement XLS export logic here
    render plain: "Exporting as XLS"
  end

  def export_as_docx
    # Implement DOCX export logic here
    render plain: "Exporting as DOCX"
  end
end