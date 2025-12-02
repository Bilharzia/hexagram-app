Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "hive#show", as: :authenticated_root
  end

  root "hive#index"  # página pública temporal

  # El hive: una sola ruta para todo el árbol
  get "hive", to: "hive#show", as: :hive
  get "hive/:id", to: "hive#show", as: :hive_hex
end
