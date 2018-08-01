require 'sinatra/base'
require './models/bookmark.rb'

class BookmarkManager < Sinatra::Base

get '/' do
  erb :index
end

get '/manager' do
  erb :manager
end

post '/manager' do
  Bookmark.add(params[:title], params[:url])
  redirect '/manager'
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

run! if app_file == $0

end
