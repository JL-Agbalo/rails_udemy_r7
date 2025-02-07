class LocationsController < ApplicationController
  def states
    @states = State.where(country_id: params[:country_id])
    render json: @states
  end

  def cities
    @cities = City.where(state_id: params[:state_id])
    render json: @cities
  end
end
