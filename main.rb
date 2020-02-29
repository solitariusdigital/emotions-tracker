# erb file / files in views do not require relative

require 'sinatra'
require 'bcrypt'

enable :sessions


require_relative 'models/user'
require_relative 'models/moods'
require_relative 'db/shared'
require_relative 'controllers/user_controller'
require_relative 'controllers/mood_controller'

if development? # only run the code in development
  require 'pry'
  require 'sinatra/reloader'

  also_reload 'models/user'
  also_reload 'models/moods'
  also_reload 'db/shared'
  also_reload 'controllers/mood_controller'
  also_reload 'controllers/user_controller'
end

get '/' do
  
  erb :home
end

get '/about' do
  
  erb :about
end

get '/signup' do
  
  erb :"users/signup"
end

get '/login' do
  
  erb :"users/login"
end

# bundle
# heroku create
# heroku apps:rename .....
# git push heroku master
# heroku open
# heroku logs