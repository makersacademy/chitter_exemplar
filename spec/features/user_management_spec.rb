feature "User management" do
  scenario "Shows a welcome message on the front page" do
    visit "/"

    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "I can sign up as a user" do
    sign_up

    expect(page).to have_content("Logged in as: sdorunga")
  end

  scenario "I can't sign up if passwords do not match" do
    sign_up(password_confirmation: "wrongPasswordConfirm")

    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "I can't sign up with an already taken email address" do
    sign_up
    visit "/"
    click_button "Sign Out"
    sign_up(username: "sdorunga1")

    expect(page).to have_content("Email is already taken")
  end

  scenario "I can't sign up with an already taken username" do
    sign_up
    visit "/"
    click_button "Sign Out"
    sign_up(email: "user@test.com")

    expect(page).to have_content("Username is already taken")
  end

  scenario "I can sign in as a user" do
    create_user

    visit "/"
    click_link "Sign In"
    fill_in :email, with: "stefan@makersacademy.com"
    fill_in :password, with: "supersecret"
    click_button "Sign In"

    expect(page).to have_content("Logged in as: sdorunga")
  end

  scenario "I can sign out" do
    sign_in

    visit "/"
    click_button "Sign Out"

    visit "/peeps/new"
    expect(page).to have_content("You must be signed in to post peeps")
  end

  def sign_up(email: "stefan@makersacademy.com",
              username: "sdorunga",
              name: "Stefan",
              password: "supersecret",
              password_confirmation: "supersecret")
    visit "/"
    click_link "Sign Up"
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :username, with: username
    click_button "Sign Up"
  end
end
