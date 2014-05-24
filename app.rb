require 'sinatra'
require 'slim'
require 'sinatra/activerecord'
require 'yaml'
require 'pry'
require 'sinatra-env'
require './base'

class App < Sinatra::Application

	class Protected < Base
		use Rack::Auth::Basic, "Restricted Area" do |username, password|
		    [username, password] == ['admin', 'admin']  
		end

		get '/admin' do
		  "Protected Area"
		end
	end

	class Public < Base
		get '/' do
		  slim :index
		end

		get '/contact' do
		  slim :contact
		end

		get '/about' do
		  slim :about
		end

		get '/products' do
		  slim :products
		end

		get '/products_single' do
		  slim :products_single
		end
	end
end