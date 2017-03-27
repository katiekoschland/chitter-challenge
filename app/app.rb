ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  set :sessions, true
  set :session_secret, 'super secret'

  get '/' do
    'hello'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    p session[:user_id]
    redirect to('/')
  end

  helpers do
    def current_user
      p session[:user_id]
      p User.get(session[:user_id])
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
