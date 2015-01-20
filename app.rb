require 'sinatra'
require 'sinatra/activerecord'
require './models'
require 'bundler/setup'
require 'rack-flash'

set :database, "sqlite3:app.sqlite3"
set :sessions, true
enable :sessions
use Rack::Flash, :sweep => true

get '/' do
	erb :home
end


post '/' do
	@user = User.where(:email_address => params[:email_address]).first
	if @user.password == params[:password]
		flash[:notice] = "Hello, #{@user.email_address}!"
	else
		redirect "/"
	end
end

