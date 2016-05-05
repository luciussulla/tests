Rails.application.routes.draw do
  
  get '/all_exercises', to: "exercises#all_exercises"
  root 'exercises#index'
  
  get 'exercises/test', to: "exercises#test", as: :test
  post'exercises/test', to: "exercises#test", as: :test_post
  
  resources :exercises
  
  get "/checkbox", to: "exercises#checkbox", as: :checkbox
end
