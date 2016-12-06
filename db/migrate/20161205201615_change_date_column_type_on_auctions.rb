class ChangeDateColumnTypeOnAuctions < ActiveRecord::Migration[5.0]
  def change
    change_column :auctions, :date_ending,  :string
  end
end
