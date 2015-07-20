class Api::JacksController < ApplicationController
  def show
    @jack = Jack.find(params[:id])

    render json: @jack
  end
end
