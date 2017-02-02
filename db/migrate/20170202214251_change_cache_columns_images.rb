class ChangeCacheColumnsImages < ActiveRecord::Migration[5.0]
  def self.up
    add_column :images, :cached_votes_total, :integer, default: 0
    add_column :images, :cached_votes_score, :integer, default: 0
    add_column :images, :cached_votes_up, :integer, default: 0
    add_column :images, :cached_votes_down, :integer, default: 0
    add_column :images, :cached_weighted_score, :integer, default: 0
    add_column :images, :cached_weighted_total, :integer, default: 0
    add_column :images, :cached_weighted_average, :float, default: 0.0
    add_index  :images, :cached_votes_total
    add_index  :images, :cached_votes_score
    add_index  :images, :cached_votes_up
    add_index  :images, :cached_votes_down
    add_index  :images, :cached_weighted_score
    add_index  :images, :cached_weighted_total
    add_index  :images, :cached_weighted_average
    add_column :images, :likes_count, :integer, default: 0
  end

  def self.down
    remove_column :images, :cached_votes_total
    remove_column :images, :cached_votes_score
    remove_column :images, :cached_votes_up
    remove_column :images, :cached_votes_down
    remove_column :images, :cached_weighted_score
    remove_column :images, :cached_weighted_total
    remove_column :images, :cached_weighted_average
    remove_column :images, :likes_count
  end
end