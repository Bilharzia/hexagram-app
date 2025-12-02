class Hex < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent, polymorphic: true, optional: true
  has_many :children, class_name: "Hex", foreign_key: "parent_id", dependent: :destroy

  has_one_attached :avatar

  enum hex_type: { user_hex: 0, folder_hex: 1 }

  validates :title, presence: true

  scope :roots, -> { where(parent_id: nil) }
end
