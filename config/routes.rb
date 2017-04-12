Rails.application.routes.draw do
  scope module: :v1 do
    resources :authors, only: [:index, :create, :update, :destroy, :show]
    resources :books, only: [:index, :create, :update, :destroy, :show]
    resources :book_copies, only: [:index, :create, :update, :destroy, :show] do
      member do
        put :borrow
        put :return_book
      end
    end
    resources :users, only: [:index, :create, :update, :destroy, :show]
  end
end
