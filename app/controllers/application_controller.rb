require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    # User.create(:username => "me", :password => "moo", :balance => 25000)
    erb :index
  end

  post '/login' do
    @user = Helpers.find_user(params)
    if @user.nil?
      erb :error
    else
      session[:id] = @user.id
      redirect to '/account'
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
