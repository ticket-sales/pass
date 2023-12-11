Rails.application.routes.draw do
  root "terminal#terminal"
  get '/terminal' => 'terminal#terminal'
  post '/terminal/entry' => 'terminal#entry'
  post '/terminal/exit' => 'terminal#exit'
end
