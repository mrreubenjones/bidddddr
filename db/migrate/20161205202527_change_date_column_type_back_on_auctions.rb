class ChangeDateColumnTypeBackOnAuctions < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :date_ending, :string
    add_column :auctions, :date_ending, :date
  end
end
