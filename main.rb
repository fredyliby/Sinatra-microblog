require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

configure(:development){set :database, "sqlite3:blogdb.sqlite3"}
require './models'
require './post'

enable :sessions
set :sessions => true

 def current_user     
 	if session[:user_id]       
 		@current_user = User.find(session[:user_id])     
 	end   
 end



get '/' do
	@user = User.new
	erb :home
end

post '/current_user' do
	@user = User.create(params)
	session[:user_id] = @user.id
	redirect '/create_post'

post '/sign-in' do
	@user = User.where(username: params[:username]).first
	if @user &&@user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/create_post'

	else
		redirect '/home'
		puts "email or password incorrect"
	end
end



get '/post' do
	if session[:user_id]
	erb :new
end	

post '/post' do
	if current_user
		erb :post
	else
		redirect '/' 
	end
end

get '/create_post' do
	if session[:user_id] 
		erb :new
	else
		redirect '/'
	end
end

post '/create_post' do
	if session[:user_id]
		Post.create!(params)
		redirect '/posts'
	else
		redirect '/'
	end
end

get '/posts' do 
	if @user = User.find(session[:user_id])
	@posts = Post.all 
	erb :show
else
	redirect '/'
end
end


get '/sign_out' do
	session[:user_id] = nil
	redirect '/'
end

get '/profile' do
	 @user = User.find(session[:user_id])
	 erb :index
end

get '/destroy' do
	 @user = User.destroy(session[:user_id])
	redirect '/'
	erb :home

end

















