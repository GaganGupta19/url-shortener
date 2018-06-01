Rails.application.routes.draw do
  resources :shortened_urls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #:new, :edit, :update
      namespace :features do
        resources :url_shorteners, only: [:create, :destroy, :index], param: :unique_key do
          collection do
            get 'search/:unique_key', action: :search
          end
        end
      end
    end
  end

  root 'shortened_urls#index'
end
