require 'sinatra'
#Note: the "require" below was recommended
require 'json'

get '/' do
  File.read('index.html')
end

get '/favorites' do
  response.header['Content-Type'] = 'application/json'
  File.read('data.json')
end

#originally a GET; changes data on the server so it should be a POST
post '/favorites' do
  file = JSON.parse(File.read('data.json'))
  unless params[:name] && params[:oid]
#note: unsuccessfully tried to include a different return status here, but... didn't work.
    return 'Invalid Request'
    end
  movie = { name: params[:name], oid: params[:oid] }
  file << movie
  File.write('data.json',JSON.pretty_generate(file))
  movie.to_json
end
