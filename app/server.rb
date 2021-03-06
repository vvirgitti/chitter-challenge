require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

  set :views, Proc.new {File.join(root, "..", "views")}
  set :session_secret, 'secret session'
  set :root, File.dirname(__FILE__)
  set :public_folder, Proc.new {File.join(root, '../public')}


  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  require_relative './lib/cheet'
  require_relative './lib/user'

  DataMapper.finalize
  DataMapper.auto_upgrade!


  get '/' do
    @cheets = Cheet.all
    @users = User.all
    erb :index
  end


  post '/cheets' do
    message = params["message"]
    created_at = 2015-05-06
    user_id = params["user_id"]
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if session[:user_id] != nil
      Cheet.create(:message => message, :created_at => created_at, :user_id => user_id)
      redirect to('/')
    else
      flash[:notice] = "You need to log in to post a cheet"
      redirect to('/')
    end
  end


  get '/users/new' do
    @user = User.new
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(:email => params[:email],
                      :password => params[:password],
                      :username => params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end


  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash[:errors] = ["The email or the password is incorrect"]
      erb :"sessions/new"
    end
  end

  delete '/sessions' do
    flash[:notice] = "Goodbye!"
    session[:user_id] = nil
    redirect to('/')
  end



  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
