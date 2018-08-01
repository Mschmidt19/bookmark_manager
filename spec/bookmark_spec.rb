require './models/bookmark'

describe Bookmark do

  describe ".all" do
    it "Returns all bookmarks in an array" do
      insert_test_bookmarks
      expected_bookmarks =
      [
        {:title => 'Makers Homepage', :url => 'http://makersacademy.com'},
        {:title => 'Destroy all Software', :url => 'http://destroyallsoftware.com'},
        {:title => 'Google', :url => 'http://google.com'}
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe ".add" do
    it "Adds a bookmark to the database" do
      Bookmark.add('Facebook', 'https://www.facebook.com/')
      expect(Bookmark.all).to eq [{ :title => 'Facebook', :url => 'https://www.facebook.com/' }]
    end
  end

end
