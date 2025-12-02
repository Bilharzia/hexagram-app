Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root "hive#show", as: :authenticated_root
  end

  root "hive#index"  # página pública temporal

  # Ruta principal del hive (la que ya usas)
  get "hive", to: "hive#show", as: :hive
  get "hive/:id", to: "hive#show", as: :hive_hex

  # RECURSOS ANIDADOS PARA HEXES (esto es lo que te faltaba)
  resources :hexes, only: [:new, :create, :edit, :update, :destroy] do
    # Esto permite crear hexes hijos de hexes (anidado)
    resources :hexes, only: [:new, :create], shallow: true
  end

  # Opcional: si también quieres poder editar hexes directamente por ID
  # get  "hexes/:id/edit", to: "hexes#edit",   as: :edit_hex
  # patch "hexes/:id",     to: "hexes#update"
end
