require 'csv'
require 'prawn'

class BelfastemployeeExportService
  def initialize(employees)
    @employees = employees
  end

  def to_pdf
    data_rows = employee_data_rows
    Prawn::Document.new do
      text "Employee List", size: 30, style: :bold
      move_down 20
      table data_rows do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ["DDDDDD", "FFFFFF"]
      end
    end.render
  end

  def to_csv
    CSV.generate(col_sep: ",") do |csv|
      csv << @employees.first.class.column_names
      @employees.each do |record|
        csv << record.attributes.values
      end
    end
  end


  def to_txt
    FAIL
  end

  def to_xls
    FAIL
  end

  def to_docx
    FAIL
  end

  private

  def employee_data_rows
    [["First Name", "Last Name", "Salary", "Notes"]] +
    @employees.map do |emp|
      [emp.firstname, emp.lastname, emp.salary, emp.notes]
    end
  end
end