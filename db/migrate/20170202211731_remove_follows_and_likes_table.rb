class RemoveFollowsAndLikesTable < ActiveRecord::Migration
  def change
    drop_table :follows
    drop_table :votes
  end
end
