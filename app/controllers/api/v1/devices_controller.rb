class Api::V1::DevicesController < ApplicationController

  def index
    @device_array = Guh::Device.all

    respond_to do |format|
      format.json { render json: @device_array }
    end
  end

  def show
    @device = Guh::Device.find(params[:id])

    respond_to do |format|
      format.json { render json: @device }
    end
  end

  def create
    device_class_id = params[:device].delete(:deviceClassId)

    device_id = Guh::Device.add(device_class_id, device_params[:deviceDescriptorId], device_params[:deviceParams])

    respond_to do |format|
      format.json { render json: {device_id: device_id} }
    end
  end

  def confirm_pairing
    device_id = Guh::Device.confirm_pairing(params[:pairing_transaction_id])

    respond_to do |format|
      format.json { render json: {device_id: device_id} }
    end
  end

  def destroy
    response = Guh::Device.remove(params[:id])

    respond_to do |format|
      format.json { render json: response }
    end
  end

  def discover
    @discovered_devices = Guh::Device.discover(params[:device_class_id], JSON.parse(params[:discovery_params]))

    respond_to do |format|
      format.json { render json: @discovered_devices }
    end
  end

  private

  def device_params
    params.require(:device).permit!
  end

end
