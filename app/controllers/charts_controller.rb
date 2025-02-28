class ChartsController < ApplicationController
  def index
    @sales = Sale.all
    @chart_types = {
      'Line Chart': 'line',
      'Bar Chart': 'bar',
      'Pie Chart': 'pie',
      'Doughnut Chart': 'doughnut',
      'Radar Chart': 'radar',
      'Polar Area Chart': 'polarArea',
      'Bubble Chart': 'bubble',
      'Scatter Chart': 'scatter',
      'Area Chart': 'area'
    }
  end

  def fetch_sales_data
    render json: { months: Sale.pluck(:monthname), amount: Sale.pluck(:amount) }
  end
end
