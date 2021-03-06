AcademiaRails::Application.routes.draw do

  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"

  get 'user' => "registrations#new", as: :new


  # authenticated :user do
  #   root :to => 'home#index'
  # end

  namespace :authors do
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
  end
  resources :tags

   scope module: 'course' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    post 'pages/gracias'
    get 'posts' => 'posts#index', as: :posts
    get 'posts/:id' => 'posts#show', as: :post
    get 'welcome' => 'pages#welcome', as: :welcome
  end

  root :to => "course/pages#welcome"


  devise_for :authors, :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users, :posts
end
