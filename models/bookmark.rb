require 'pg'
require 'uri'
require "net/http"
require "set"

class Bookmark

  def self.all
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'bookmark_manager')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    result = connection.exec "TABLE bookmarks"
    result.map { |bookmark| { :url => bookmark['url'], :title => bookmark['title'] } }
  end

  def self.add(new_title, new_url)
    return false unless valid_url?(new_url)
    if ENV['RACK_ENV'] == 'development'
      connection = PG.connect(dbname: 'bookmark_manager')
    elsif ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    end
    connection.exec "INSERT INTO bookmarks (title, url) VALUES ('#{new_title}', '#{new_url}')"
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

  # def self.url_exist?(url_string)
  #   url = URI.parse(url_string)
  #   req = Net::HTTP.new(url.host, url.port)
  #   req.use_ssl = (url.scheme == 'https')
  #   path = url.path if url.path.nil?
  #   res = req.request_head(path || '/')
  #   if res.kind_of?(Net::HTTPRedirection)
  #     url_exist?(res['location']) # Go after any redirect and make sure you can access the redirected URL
  #   else
  #     ! %W(4 5).include?(res.code[0]) # Not from 4xx or 5xx families
  #   end
  #   rescue Errno::ENOENT
  #     false #false if can't find the server
  #   rescue Errno::ECONNREFUSED
  #     false
  #   rescue SocketError
  #     false
  # end

end
