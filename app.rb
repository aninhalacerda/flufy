require 'sinatra'
require 'slim'
require 'sinatra/activerecord'
require 'yaml'
require 'pry'
require 'sinatra-env'

DB_CONFIG = YAML::load(File.open('config/database.yml'))[Sinatra.env]
set :database, "mysql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"

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