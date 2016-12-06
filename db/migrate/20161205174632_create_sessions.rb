class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions, &:timestamps
  end
end
