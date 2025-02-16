class TransfersController < ApplicationController
  def index
    @transfers = Transfer.includes(:from_account, :to_account)
  end

  def new
    @transfer = Transfer.new
  end

  def create
    # FAIL
  end 

end
