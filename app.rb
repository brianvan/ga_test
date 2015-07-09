require 'sinatra'
require 'json'

get '/' do
  File.read('index.html')
end

