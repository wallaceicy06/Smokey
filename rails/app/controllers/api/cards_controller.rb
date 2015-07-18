class Api::CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])

    render json: @card
  end

  def index
    render json: Card.all
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    @card = Card.find(params[:id])

    if @card.update_attributes(card_params)
      render json: @card, status: :ok
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
  
    if @card.destroy
      head :no_content
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private

    def card_params 
      params.require(:card).permit(:name, :capacity, :deck_id)
    end

end
