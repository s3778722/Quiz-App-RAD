Rails.application.routes.draw do
  get 'quiz/start'
  resources :quiz_items
  get 'home/index'
  root 'home#index'

  get 'quiz', to: 'quiz#start', as: 'quiz_get'
  post 'quiz', to: 'quiz#start', as: 'quiz_post'
  post 'set', to: 'home#set', as: 'home_set'

  get 'quiz/result', to: 'quiz#result', as: 'result'
  get 'quiz/reload', to: 'quiz#reload', as: 'quiz_reload'
  get 'quiz/redo', to: 'quiz#redo', as: 'quiz_redo'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
