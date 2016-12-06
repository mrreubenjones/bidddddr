class TransitionsController < ApplicationController
  before_action :find_auction

  def create_draft
    if @auction.draft!
      redirect_to @auction, notice: 'Auction is now a draft'
    else
      redirect_to @auction, alert: 'Can\'t do this. Sorry.'
    end
  end

  def create_cancel
    if @auction.cancel!
      redirect_to @auction, notice: 'Auction is cancelled'
    else
      redirect_to @auction, alert: 'Can\'t do this. Sorry.'
    end
  end

  def create_publish
    if @auction.publish!
      redirect_to @auction, notice: 'Auction published'
    else
      redirect_to @auction, alert: 'Can\'t do this. Sorry.'
    end
  end

  def create_met
    if @auction.met!
      redirect_to @auction, notice: 'Auction reserve price has been met'
    else
      redirect_to @auction, alert: 'Can\'t do this. Sorry.'
    end
  end

  def create_not_met
    if @auction.not_met!
      redirect_to @auction, notice: 'Auction reserve price not met'
    else
      redirect_to @auction, alert: 'Can\'t do this. Sorry.'
    end
  end

private

  def find_auction
    @auction = Auction.find params[:auction_id]
  end


end
