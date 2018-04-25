class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :acceptor_id

      t.timestamps
    end
  end
end
