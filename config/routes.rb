Rails.application.routes.draw do

  devise_for :users
  root 'home#welcome'
  resources :cleaning_environments, path: 'limpeza-dos-ambientes', path_names: { new: 'novo', edit: 'editar'}
  resources :environments, path: 'ambientes', path_names: { new: 'novo', edit: 'editar' }
  resources :cleaning_rooms, path: 'limpeza-dos-quartos', path_names: { new: 'novo', edit: 'editar' }
  resources :employees, path: 'funcionarios', path_names: { new: 'novo', edit: 'editar' }
  resources :guests, path: 'hospedes', path_names: { new: 'novo', edit: 'editar' }
  resources :services, path: 'servicos', path_names: { new: 'novo', edit: 'editar' }
  resources :courtesies, path: 'produtos-cortesia', path_names: { new: 'novo', edit: 'editar'}
  resources :rooms, path: 'quartos', path_names: { new: 'novo', edit: 'editar' }
  resources :users, path: 'usuarios', only: [:index, :show, :edit, :update], path_names: { edit: 'editar' }
  resources :meals, path: 'refeicoes', path_names: { new: 'novo', edit: 'editar' }
  resources :bookings, path: 'reservas', path_names: { new: 'novo', edit: 'editar' }
  resources :invoices, path: 'faturas', path_names: { new: 'novo', edit: 'editar' }
  resources :services_uses, path: 'uso-dos-servicos', path_names: { new: 'novo', edit: 'editar' }
  resources :meals_uses, path: 'consumo-das-refeicoes', path_names: { new: 'novo', edit: 'editar' }
  resources :courtesies_uses, path: 'uso-dos-produtos-cortesia', path_names: { new: 'novo', edit: 'editar' }
  resources :environments_uses, path: 'uso-dos-ambientes', path_names: { new: 'novo', edit: 'editar' }
end
