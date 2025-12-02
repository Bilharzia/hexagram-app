class HiveController < ApplicationController
  before_action :set_current_hex, only: :show

  def index
    # aquí puedes poner lógica, o dejarlo vacío para que solo renderice la vista
  end

  def show
    @hexes = @current_hex&.children || current_user.hexes.roots
    @breadcrumbs = build_breadcrumbs
  end

  private

  def set_current_hex
    @current_hex = params[:id].present? ? Hex.find(params[:id]) : nil
  end

  def build_breadcrumbs
    return [] unless @current_hex
    build_breadcrumbs_recursive(@current_hex) + [@current_hex]
  end

  def build_breadcrumbs_recursive(hex)
    return [] unless hex.parent
    build_breadcrumbs_recursive(hex.parent) + [hex.parent]
  end
end
