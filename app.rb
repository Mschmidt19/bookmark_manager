require 'sinatra/base'
require 'sinatra/flash'
require './models/bookmark.rb'

class BookmarkManager < Sinatra::Base

register Sinatra::Flash
enable :sessions

get '/' do
  erb :index
end

get '/manager' do
  erb :manager
end

post '/manager' do
  if Bookmark.add(params[:title], params[:url])
    flash[:success] = "Successfully added bookmark"
  else
    flash[:error] = "Please enter a valid URL"
  end
  redirect '/manager'
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

run! if app_file == $0

end
