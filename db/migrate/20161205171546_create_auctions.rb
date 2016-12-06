class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions, &:timestamps
  end
end
