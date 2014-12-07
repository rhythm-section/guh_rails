class Api::V1::StatesController < ApplicationController

  def index
    @state = Guh::State.all(params[:device_id])

    respond_to do |format|
      format.json { render json: @state }
    end
  end

  def show
    @state = Guh::State.find(params[:device_id], params[:id])

    respond_to do |format|
      format.json { render json: @state }
    end
  end

end
