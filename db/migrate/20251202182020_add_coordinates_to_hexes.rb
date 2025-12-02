class AddCoordinatesToHexes < ActiveRecord::Migration[7.1]
  def change
    add_column :hexes, :ring, :integer
    add_column :hexes, :distance, :integer
    add_column :hexes, :direction, :integer
  end
end
