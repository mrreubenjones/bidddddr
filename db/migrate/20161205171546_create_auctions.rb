class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|

      t.timestamps
    end
  end
end
