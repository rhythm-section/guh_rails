class Api::V1::RulesController < ApplicationController

  def index
    @rules = Guh::Rule.all

    respond_to do |format|
      format.json { render json: @rules }
    end
  end

  def create
    @rule = Guh::Rule.add(params[:rule])

    respond_to do |format|
      format.json { render json: @rule }
    end
  end

end
