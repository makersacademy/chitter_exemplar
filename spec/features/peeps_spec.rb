require "timecop"

feature "Peeps" do
  before do
    sign_in
  end

  scenario "I can post peeps" do
    create_peep("OMG My cat is sooo cute! #kitty")

    expect(page).to have_content("OMG My cat is sooo cute! #kitty")
  end

  scenario "I can't post empty peeps" do
    create_peep(nil)

    expect(page).to_not have_content("Stefan")
  end

  scenario "I can see the time when a peep was posted" do
    Timecop.freeze do
      create_peep("OMG My cat is sooo cute! #kitty")

      within(".peep .timestamp") do
        expect(page).to have_content DateTime.now.strftime("%c")
      end
    end
  end

  scenario "Peeps are displayed in reverse order" do
    create_peep("OMG My cat is sooo cute! #kitty")

    Timecop.travel(DateTime.now + 1) do
      create_peep("OMG My dog is sooo cute! #puppy")
    end

    expect(page.all(".peep .content").map(&:text)).to eq(["OMG My dog is sooo cute! #puppy", "OMG My cat is sooo cute! #kitty"])
  end

  def create_peep(message)
    visit "/"
    click_link "New peep"

    fill_in :peep, with: message
    click_button "Submit"
  end
end
