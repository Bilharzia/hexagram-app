class HiveController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_hex = params[:id].present? ? Hex.find(params[:id]) : nil
    @hexes = @current_hex&.children || current_user.hexes.roots
    @breadcrumbs = build_breadcrumbs(@current_hex)
  end

  private

  def build_breadcrumbs(hex, breadcrumbs = [])
    return breadcrumbs unless hex
    build_breadcrumbs(hex.parent, breadcrumbs)
    breadcrumbs << hex
    breadcrumbs
  end
end
