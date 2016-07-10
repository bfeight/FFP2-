class AddGiphyUrlToVisual < ActiveRecord::Migration[5.0]
  def change
    add_column :visuals, :giphy_url, :text
  end
end
