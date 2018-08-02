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
  if Bookmark.valid_url?(params[:url])
    Bookmark.add(params[:title], params[:url])
    redirect '/bookmarks'
  else
    flash[:invalid_url] = "Please enter a valid URL mate"
    redirect '/manager'
  end
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb :bookmarks
end

run! if app_file == $0

end
