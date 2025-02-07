class OffshoreemployeesController < ApplicationController
  def new
    @offshoreemployee = Offshoreemployee.new
  end

  def create
    @offshoreemployee = Offshoreemployee.new(offshoreemployee_params)
    if @offshoreemployee.save
      redirect_to @offshoreemployee, notice: 'Offshore employee was successfully created.'
    else
      render :new
    end
  end

  def get_states
    @states = State.where(country_id: params[:country_id])
    respond_to do |format|
      format.json { render json: @states }
    end
  end

  def get_cities
    @cities = City.where(state_id: params[:state_id])
    respond_to do |format|
      format.json { render json: @cities }
    end
  end

  private

  def offshoreemployee_params
    params.require(:offshoreemployee).permit(:firstname, :lastname, :country_id, :state_id, :city_id)
  end
end