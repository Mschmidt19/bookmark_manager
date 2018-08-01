feature "User is able to add a new bookmark" do
  scenario "Adding a bookmark" do
    visit '/'
    click_button "Bookmarks"
    fill_in "title", with: "Diode"
    fill_in "url", with: "https://diode.makersacademy.com/students"
    click_button "Add"
    click_button "View all"
    expect(page).to have_link("Diode", :href => "https://diode.makersacademy.com/students")
  end
end
