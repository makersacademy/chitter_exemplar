feature "Navigation:" do
  scenario "clicking 'Sign Up' twice takes you to the correct url" do
    visit "/users/new"
    click_link "Sign Up"

    # Confirm that it doesn't go to a 404
    expect(page).to have_content("Password Confirmation")
  end

  scenario "clicking 'Sign In' twice takes you to the correct url" do
    visit "/users/new"
    click_link "Sign In"

    # Confirm that it doesn't go to a 404
    expect(page).to have_content("Password")
  end
end