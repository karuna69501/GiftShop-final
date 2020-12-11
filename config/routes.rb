Rails.application.routes.draw do
  resources :orders do
    resources:orderproducts
  end
  
  devise_for :users
  get 'cart/index'
  
  get '/checkout' => 'cart#createOrder'

  resources :products
  root 'static_pages#homepage'

  get '/productCatalog' => 'static_pages#productCatalog'

  get '/deliveryInfo' => 'static_pages#deliveryInfo'

  get '/contactUs' => 'static_pages#ContactUs'
  
  get '/login_path' => 'user#login' 
  
  get '/logout_path' => 'user#logout'
  
  get '/cart' => 'cart#index'
  
  get '/cart/:id' => 'cart#add'
  
  get '/remove/:id' => 'cart#removeProduct'
  
  get '/decrease/:id' => 'cart#decrease'
  
  get '/increase/:id' => 'cart#increase'
  
  get '/clearcart' => 'cart#clearcart'
  
  get '/paid/:id' => 'static_pages#paymentCompleted'

  get '/Thankyou/:id' => 'static_pages#Thankyou'
  
  get '/admin' => 'static_pages#adminPanel'
  
  post'/search' => 'products#search'
  
  get '/category/:title'=> 'static_pages#category'
  
    get '/assignAdmin/:id' => 'static_pages#assignAdmin'
 
  get '/unassignAdmin/:id' => 'static_pages#unassignAdmin'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
