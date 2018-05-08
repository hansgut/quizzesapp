Rails.application.routes.draw do
  get 'helpersections/index'

  devise_for :users
  resources :attempts
  resources :quizzes
  resources :theories
  resources :diagrams
  resources :determinations
  resources :practices
  post "/upload_file" => "upload#upload_file", :as => :upload_file
  post "/upload_image" => "upload#upload_image", :as => :upload_image
  get "/download_file/:name" => "upload#access_file", :as => :upload_access_file, :name => /.*/
  root 'homes#index'
end
