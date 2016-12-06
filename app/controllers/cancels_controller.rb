class CancelsController < ApplicationController

  def create
  auction = Auction.find params[:auction_id]
    if auction.cancel!
      redirect_to auction, notice: 'Auction cancelled'
    else
      redirect_to auction, alert: 'Can\'t cancel the auction'
    end
  end

end
