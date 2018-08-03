feature "Validate URLs" do
  scenario "User enters an invalid URL" do
    visit '/manager'
    fill_in "title", with: "Google"
    fill_in "url", with: "htp/gogle.com"
    click_button "Add"
    expect(page).to have_content "Please enter a valid URL"
  end
  scenario "User enters a valid URL" do
    visit '/manager'
    fill_in "title", with: "Facebook"
    fill_in "url", with: "http://facebook.com"
    click_button "Add"
    expect(page).to have_content "Successfully added bookmark"
    click_button "View all"
    expect(page).to have_link("Facebook", :href => "http://facebook.com")
  end
end
