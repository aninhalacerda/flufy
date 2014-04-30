require 'sinatra'
require 'slim'

helpers do
  def include_slim(name, options = {}, &block)
  	if name == 'header'
  		slim :header
  	elsif name == 'footer'
		slim :footer
  	end
  end
end

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