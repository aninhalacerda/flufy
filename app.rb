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