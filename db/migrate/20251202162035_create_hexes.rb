class CreateHexes < ActiveRecord::Migration[7.0]
  def change
    create_table :hexes do |t|
      t.string :title, null: false
      t.text :description
      t.integer :hex_type, default: 0, null: false  # 0 = user_hex, 1 = folder_hex
      t.references :parent, polymorphic: true, null: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end

    add_index :hexes, [:parent_id, :parent_type]
    add_index :hexes, :hex_type
    add_index :hexes, :title
  end
end
