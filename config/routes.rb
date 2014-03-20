Gotocollegeinus::Application.routes.draw do

    
  

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match "/search/:type/", to: "search#index", as: "search"
  match "/", to: "public#index"
  match "/activate/:type/:key", to:"activate_user#index"
  match "/page/verify", to:"page#verify"
  match "/a/:key/p/",to:"page#proceed"
  match "/page/activate/", to:"page#activate"
  match "/u/:ds/c/", to: "user#create"
  match "/u/:cont/l", to:"session#create", as: "session_create"
  match "/a/:key/u/", to: "activate_user#update"
  match "/login/:type/:cont/:in/",to: "session#index", as: "login"
  match "/public/logout/", to: "session#destroy", as: "logout"
  match "/check/username/",to: "username#uexits"
  match "/create/page/", to:"page#new"
  match "/p/:key/c/", to:"page#create"
  match "/manage/page/requests/",to:"admin_page#page_request",as:"page_request"
  match "/manage/login/:type/",to:"admin_page#login",as:"page_login"
  match "/manage/login/" => redirect("/manage/login/public/")
  match "/get/page/:type/", to:"admin_page#getpage"
  match "/profile/:id", to:"user#profile"
  

  root to: "public#index"

  # Gotocollegeinus::Application.routes.draw do
  #   match '*a',to:"public#found"
  # end





  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
