Rails.application.routes.draw do
  get 'quiz/start'
  resources :quiz_items
  get 'home/index'
  root 'home#index'

  get 'quiz', to: 'quiz#start', as: 'quiz_get'
  post 'quiz', to: 'quiz#start', as: 'quiz_post'


  get 'quiz/result', to: 'quiz#result', as: 'result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
