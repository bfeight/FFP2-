class AddUserToVisual < ActiveRecord::Migration[5.0]
  def change
    add_reference :visuals, :user, foreign_key: true
  end
end
