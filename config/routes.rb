Rails.application.routes.draw do

  resources :shortened_urls, only: [:index, :new, :create] do
    collection do
      post 'upload_from_csv'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      #:new, :edit, :update
      namespace :features do
        resources :url_shorteners, only: [:create, :destroy, :index, :show], param: :unique_key
      end
    end
  end

  get '/:unique_key' => 'shortened_urls#redirect_handler'
  root 'shortened_urls#new'
end
