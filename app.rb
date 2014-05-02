require 'sinatra'
require 'slim'

helpers do
  def include_slim(name, options = {}, &block)
  	slim name.to_sym
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