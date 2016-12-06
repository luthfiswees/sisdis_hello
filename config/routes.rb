Rails.application.routes.draw do
  get 'hello_service/hello'

  wash_out :hello_service

  root :to => 'hello_models#pr2'

  get '/tugas3/klien', to: 'hello_models#pr3'
  post '/hello_models/hello_soap', to: 'hello_models#hello_soap'

  get '/tugas4/klien/uploadImage', to: 'hello_models#pr4'
  get '/tugas4/klien/viewImage/:filename', to: 'hello_models#view_image'
  post '/hello_models/post_image', to: 'hello_models#post_image'
  post '/hello_models/save_image', to: 'hello_models#store_image'

  get "/tugas5/server", to: 'hello_models#pr5'
  
  get "/tugas1", to: 'hello_models#tugas1'
  post "/hello_models/ping", to: 'hello_models#ping'
  post "/hello_models/getSaldo", to: 'hello_models#getSaldo'
  post "/hello_models/getTotalSaldo", to: 'hello_models#getTotalSaldo'
  post "/hello_models/transfer", to: 'hello_models#transfer'
  post "/hello_models/register", to: 'hello_models#register'

  #buat nyoba sisprog hehehe
  get "/cobasysprog", to: 'hello_models#cobasysprog'
  post "/hello_models/nyalain", to: 'hello_models#nyalain'
  post "/hello_models/matiin" , to: 'hello_models#matiin'

  resources :hello_models
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
