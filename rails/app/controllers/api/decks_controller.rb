class Api::DecksController < ApplicationController
  # TODO REMOVE_THIS
  skip_before_action :authenticate_request

  Deck = ::Deck

  def show
    @deck = Deck.find(params[:id])

    render json: @deck
  end

  def index
    render json: Deck.all
  end

  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      render json: @deck, status: :created
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  def update
    @deck = Deck.find(params[:id])

    if @deck.update_attributes(deck_params)
      render json: @deck, status: :ok
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
  
    if @deck.destroy
      head :no_content
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  private

    def deck_params
      params.require(:deck).permit(:name)
    end
end
