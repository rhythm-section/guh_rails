class Api::V1::DevicesController < ApplicationController
  
  def index
    @device_array = Guh::Device.all
    
    respond_to do |format|
      format.json { render json: @device_array }
    end
  end
  
  def create
    device_class_id = params[:device].delete(:deviceClassId)
    
    Guh::Device.add(device_class_id, device_params)
    
    respond_to do |format|
      format.json { head :ok }
    end
  end
  
  private
  
  def device_params
    params.require(:device).permit!
  end
  
end
