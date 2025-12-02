# frozen_string_literal: true

class Hexagon::Component < ViewComponent::Base
  def initialize(hex:, current_hex: nil)
    @hex = hex
    @current_hex = current_hex
  end

  def link_path
    @hex == @current_hex ? '#' : hive_hex_path(@hex)
  end

  def avatar_url
    @hex.avatar.attached? ? @hex.avatar : "https://ui-avatars.com/api/?name=#{CGI.escape(@hex.title)}&background=6366f1&color=fff"
  end
end
