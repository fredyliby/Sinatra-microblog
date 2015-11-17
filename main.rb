require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

configure(:development){set :database, "sqlite3:blogdb.sqlite3"}
require './models'

enable :sessions

 def current_user     
 	if session[:user_id]       
 		@current_user = User.find(session[:user_id])     
 	end   
 end



get '/login' do
	puts "login"
	erb :home
end

post '/login' do
	@user = User.where(username: params[:username]).first
	if @user &&@user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/'

	else
		redirect '/login'
	end
end



get '/post' do
	puts "post"
	erb :post
end	

post '/post' do
	if current_user
		erb :post
	else
		redirect '/login' 
	end
end




post '/login' do
	#form will send username and password
	#Find User with the username
	#User.where().first
	puts User.create
end
	
	

get '/signup' do
	# puts User.all

	erb :signup
end

post '/signup' do

	# {"user"=>{"email"=>"test@examp.com", "name"=>"test", "last_name"=>"tere", "password"=>"pass"}
	puts params.inspect
	# User.create
	"submitted form"
end

post '/create_post' do
  @p = params[:post]
  my_post = Post.create(@p)

end


get '/sign_out' do
	session[:user] = nil
	erb :login
end

















