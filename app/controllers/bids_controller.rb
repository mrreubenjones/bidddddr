class BidsController < ApplicationController
  def index
    @bids = current_user.bids
  end

  def create
    @bids = Bid.order(amount: :DESC)
    @auction = Auction.find params[:auction_id]
    bid_params = params.require(:bid).permit(:amount)
    @bid = Bid.new bid_params
    @bid.user = current_user
    @bid.auction = @auction
    if @bid.save
      if @bid.amount > @auction.reserve_price
        if @auction.published? || @auction.reserve_not_met?
          @auction.update_attributes(aasm_state: 'reserve_met')
        elsif @auction.max_amount && @auction.date_ending > Time.current
          @auction.update_attributes(aasm_state: 'won')
        end
      end
      redirect_to auction_path(@auction)
    else
      render 'auctions/show'
    end
  end
end
