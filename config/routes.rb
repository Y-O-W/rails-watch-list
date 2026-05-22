Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Here are the user actions we want to implement in our app:
  # As a user, I can see all my movie lists
  # As a user, I can create a movie list
  # As a user, I can see the details of a movie list
  # As a user, I can bookmark a movie inside a movie list
  # As a user, I can destroy a bookmark
  # Warning the movies will be seeded in the database so no need to implement any user action around the movie model.
  resources :lists, only: [ :index, :show, :new, :create ] do
    resources :bookmarks, only: [ :create ]
  end

  resources :bookmarks, only: [ :destroy ]
end
