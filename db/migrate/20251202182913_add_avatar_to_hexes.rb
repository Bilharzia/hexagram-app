class AddAvatarToHexes < ActiveRecord::Migration[7.1]
  def change
    add_column :hexes, :avatar, :string
  end
end
