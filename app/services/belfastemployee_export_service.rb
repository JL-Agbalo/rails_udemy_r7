require 'csv'
require 'prawn'
require 'caracal'

class BelfastemployeeExportService
  def initialize(employees)
    @employees = employees
  end

  def to_pdf
    data_rows = employee_data_rows
    Prawn::Document.new do
      text "Employee List", size: 30, style: :bold, align: :center
      move_down 20
      table data_rows, header: true, row_colors: ["DDDDDD", "FFFFFF"], cell_style: { borders: [:top, :bottom], padding: [5, 10] } do
        row(0).font_style = :bold
        row(0).background_color = '000000'
        row(0).text_color = 'FFFFFF'
        self.column_widths = [100, 100, 100, 200]
      end
      number_pages "<page> of <total>", at: [bounds.right - 50, 0], align: :right, size: 10
    end.render
  end

  def to_csv
    CSV.generate(col_sep: ",") do |csv|
      csv << ["First Name", "Last Name", "Salary", "Notes"]
      @employees.each do |emp|
        csv << [emp.firstname, emp.lastname, emp.salary, emp.notes]
      end
    end
  end

  def to_txt
    txt_content = "First Name\tLast Name\tSalary\tNotes\n"
    @employees.each do |emp|
      txt_content += "#{emp.firstname}\t#{emp.lastname}\t#{emp.salary}\t#{emp.notes}\n"
    end
    txt_content
  end

  def to_xls
    workbook = Spreadsheet::Workbook.new
    worksheet = workbook.create_worksheet(name: 'Employee List')
    worksheet.row(0).concat ["First Name", "Last Name", "Salary", "Notes"]

    @employees.each_with_index do |emp, index|
      worksheet.row(index + 1).push emp.firstname, emp.lastname, emp.salary, emp.notes
    end

    buffer = StringIO.new
    workbook.write(buffer)
    buffer.string
  end

  def to_docx
    # TODO FILE CORRUPTED
    temp_file = Tempfile.new(['employee_list', '.docx'])
    Caracal::Document.save(temp_file.path) do |doc|
      doc.h1 'Employee List'
      doc.hr
      doc.table employee_data_rows do
        border_color '666666'
        border_line :single
        border_size 4
        border_spacing 4
      end
    end
    temp_file.rewind
    content = temp_file.read
    temp_file.close
    temp_file.unlink
    content
  end

  private

  def employee_data_rows
    [["First Name", "Last Name", "Salary", "Notes"]] +
    @employees.map do |emp|
      [emp.firstname, emp.lastname, emp.salary, emp.notes]
    end
  end
end