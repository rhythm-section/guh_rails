class DummyController < ApplicationController

  def index
    @devices = []
    Guh::Device.all.each do |device|
      @devices << device unless @devices.map{|d| d['deviceClassId']}.include?(device['deviceClassId'])
    end

    @devices = @devices.select do |device|
      Guh::Action.all(device['deviceClassId']).length > 0
    end
  end

  def introspect
    @data = Guh::Base.introspect
    render text: "<pre>#{JSON.pretty_generate @data}</pre>"
  end

end
