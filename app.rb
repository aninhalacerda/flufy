require 'sinatra'
require 'slim'
require 'sinatra/activerecord'
require 'yaml'
require 'pry'
require 'sinatra-env'

require_relative 'models/init'

DB_CONFIG = YAML.load(ERB.new(File.read(File.join("config","database.yml"))).result)[Sinatra.env]

configure :production do
  db = URI.parse(ENV['DATABASE_URL'])
  set :database, "postgresql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{db.host}:#{db.port}/#{db.path[1..-1]}"
end

configure :development do
  set :database, "postgresql://#{DB_CONFIG['username']}:#{DB_CONFIG['password']}@#{DB_CONFIG['host']}:#{DB_CONFIG['port']}/#{DB_CONFIG['database']}"
end

models = File.join(File.dirname(__FILE__), 'models') # path to your models
$LOAD_PATH << File.expand_path(models)

# Constent Missing for requiring models files
def Object.const_missing(const)
    require const.to_s.underscore
    klass = const_get(const)
    return klass if klass
end

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