Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #:new, :edit, :update
      namespace :features do
        resources :url_shorteners, only: [:create, :destroy, :index, :show] do
          collection do
          end
        end
      end
    end
  end
end
