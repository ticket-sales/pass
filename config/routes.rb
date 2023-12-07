Rails.application.routes.draw do
  root "entry#entry"
  get '/entry' => 'entry#entry'
  post '/entry' => 'entry#check'
end
