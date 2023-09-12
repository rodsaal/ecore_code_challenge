Rails.application.routes.draw do
  namespace :api do
    resources :roles do
      post 'assign_role', on: :collection
      get 'lookup_role/:user_id/:team_id', action: :lookup_role, on: :collection
      get 'lookup_memberships/:role_id', action: :lookup_memberships, on: :collection
    end
    resources :memberships
  end
end
