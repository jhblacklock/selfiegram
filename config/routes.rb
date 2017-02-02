Rails.application.routes.draw do
  resources :users, defaults: { format: :json } do
    resources :follows, defaults: { format: :json },
                        only: [:index, :create, :destroy] do
      collection do
        get 'feed', defaults: { format: :json }
      end
    end
    get 'followers' => 'follows#followers', defaults: { format: :json }
    resources :images, defaults: { format: :json } do
      resources :likes, defaults: { format: :json }
    end
  end
  get 'popular' => 'images#popular', defaults: { format: :json }
  root 'static#index'
end
