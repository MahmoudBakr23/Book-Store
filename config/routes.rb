Rails.application.routes.draw do
  get 'publishers/index'
  get 'publishers/new'
  get 'publishers/create'
  get 'publishers/show'
  get 'publishers/edit'
  get 'publishers/update'
  get 'publishers/destroy'
  get 'authors/index'
  get 'authors/new'
  get 'authors/create'
  get 'authors/show'
  get 'authors/edit'
  get 'authors/update'
  get 'authors/destroy'
  get 'categories/index'
  get 'categories/new'
  get 'categories/create'
  get 'categories/show'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'books/index'
  get 'books/new'
  get 'books/create'
  get 'books/show'
  get 'books/edit'
  get 'books/update'
  get 'books/destroy'
  get 'about/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
