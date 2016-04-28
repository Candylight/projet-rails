class HsCardsController < ApplicationController

  before_action :set_hscard, only: [:show,:edit,:update, :destroy]

  def index
    @hscards = HsCard.paginate(page: params[:page], per_page: 1)

  end

  def show
    @hscard = HsCard.find params[:id]
  end

  def new
    @hscard = HsCard.new
  end

  def create
    @hscard = HsCard.new hscard_param
    if @hscard.save
      redirect_to @hscard
    end
  end

  def edit
  end

  def update
    if @hscard.update hscard_param
      redirect_to @hscard
    else
      render 'edit'
    end
  end

  def destroy
    @hscard.destroy
    redirect_to hs_cards_path
  end

  private

  def hscard_param
    params.require(:hs_card).permit(:name, :cost, :attack_points, :life_points)
  end

  def set_hscard
    @hscard = HsCard.find params[:id]
  end

end
