Rails.application.routes.draw do

  # get 'home', to: 'index#home'
  get 'app', to: 'index#app'

  #get 'login', to: 'session#login'
  post 'login', to: 'session#login'
  # get 'logout', to: 'session#logout'
  get 'logout', to: 'session#logout'
  # get 'register', to: 'session#register'
  post 'register', to: 'session#register'
  # get 'forgotten', to: 'session#forgotten'
  post 'forgotten', to: 'session#forgotten'
  
  post 'sendMessage', to: 'user#sendMessage'
  
  
  get 'user/info/:id', to: 'user#get_user_info' #Params :id(session) :token(post)
  get 'user/contats', to: 'user#get_list_contact' #Params :id(session)
  get 'user/conversation', to: 'user#get_conversation' #Params :id(session) :token(post)
  post 'user/conversation', to: 'user#get_conversation' #Params :id(session) :token(post)
  get 'sync', to:'user#sync_contacts' #Params :id(session) :array(token)(post)
  get 'user/new_contact'
  get 'edit', to: 'user#edit_contact' #Params :id(session)
  get 'remove', to: 'user/remove_contact' #Params :id(session)
  
  get 'group/info', to: 'group#get_group_info' #Params :id(session) :topic
  get 'group/contact', to: 'group#get_list_contact' #Params :id(session) :topic
  get 'group/conversation', to:'group#get_conversation' #Params :id(session) :topic
  get 'group/new', to: 'group#new_group' #Params :id(session)
  get 'group/edit', to: 'group#edit_group' #Params :id(session) :topic
  get 'group/remove', to: 'group#remove_group' #Params :id(session) :topic
  get 'group/user/add', to: 'group#add_user' #Params :id(session) :topic :token
  get 'group/user/remove', to: 'group#remove_user' #Params :id(session) :topic :token

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'index#home'

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
