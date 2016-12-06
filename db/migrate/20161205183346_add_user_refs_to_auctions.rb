class AddUserRefsToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_reference :auctions, :user, index: true
  end
end
