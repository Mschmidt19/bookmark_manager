feature "Validate URLs" do
  scenario "User enters an invalid URL" do
    visit '/manager'
    fill_in "title", with: "Google"
    fill_in "url", with: "htp/gogle.com"
    
  end
end
