class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hexes, dependent: :destroy
  has_many :owned_hexes, class_name: "Hex", foreign_key: :user_id, dependent: :destroy

end

# app/models/user.rb
