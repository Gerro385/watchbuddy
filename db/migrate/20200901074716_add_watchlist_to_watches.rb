class AddWatchlistToWatches < ActiveRecord::Migration[6.0]
  def change
    add_column :watches, :watchlist, :boolean, default: false
  end
end
