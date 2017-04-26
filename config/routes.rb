Rails.application.routes.draw do
  get '/pupil', to: 'mockups#pupil', as: 'pupil'
  get '/logs/:id', to: 'mockups#logs', as: 'logs'
  get '/lesson/:id', to: 'mockups#lesson', as: 'lessons'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
