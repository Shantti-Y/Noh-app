Rails.application.routes.draw do
  get '/pupil', to: 'mockups#pupil'
  get '/logs', to: 'mockups#logs'
  get '/lesson', to: 'mockups#lesson'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
