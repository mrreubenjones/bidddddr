class AuctionsController < ApplicationController
  before_action :authenticate_user

  def index
    @auctions = Auction.order(title: :DESC)
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    @auction.date_ending = params[:auction][:date_ending]
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  def show
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @bids = @auction.bids.order(amount: :DESC)
  end

  def edit
    @auction = Auction.find params[:id]
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      flash[:notice] = 'Auction updated'
      redirect_to @auction
    else
      flash.now[:alert] = 'Please see errors below!'
      render :edit
    end
  end

  def destroy
    @auction = Auction.find params[:id]
    @auction.destroy
    redirect_to auctions_path, notice: 'Auction deleted'
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :details, :date_ending, :reserve_price)
  end
end
