class AddUserRefsToBids < ActiveRecord::Migration[5.0]
  def change
    add_reference :bids, :user, index: true
  end
end
