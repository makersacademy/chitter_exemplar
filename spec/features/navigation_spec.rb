feature "Navigation:" do
  scenario "clicking 'Sign Up' twice takes you to the correct url" do
    visit "/"
    click_link "Sign Up"
    # Find something specific to the new page to confirm that it's finished loading
    fill_in :email, with: "filler text"
    click_link "Sign Up"

    # Confirm that it doesn't go to a 404
    expect(page).to have_content("Password Confirmation")
  end
end