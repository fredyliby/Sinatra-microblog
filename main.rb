require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'

set :database, "sqlite3:blogdb.sqlite3"
require './models'







get '/login' do
	puts "login"
	erb :home
end

post '/login' do
puts User.create
	end
	
	

get 'signup' do
	puts User.post

	erb:home
end


