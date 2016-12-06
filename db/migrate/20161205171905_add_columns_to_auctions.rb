class AddColumnsToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :title, :string
    add_column :auctions, :details, :text
    add_column :auctions, :date_ending, :datetime
    add_column :auctions, :reserve_price, :integer
  end
end
