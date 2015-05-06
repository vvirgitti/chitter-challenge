require 'spec_helper'

feature "user can add new cheets" do

  context "user is logged in" do

    before (:each) do
      User.create(:email => "hello@hello.com",
                  :password => "qwerty",
                  :username => "hellokitty")
    end

    scenario "adding a new cheet from the homepage" do
      visit '/'
      click_button 'Log in'
      sign_in("hello@hello.com", "qwerty")
      expect(page).to have_content("Welcome hellokitty!")
      add_cheet("Hello world", Time.now, 1)
      expect(Cheet.count).to eq(1)
      cheet = Cheet.first
      expect(cheet.message).to eq("Hello world")
      expect(cheet.created_at).to eq(Time.now)
      expect(cheet.user_id).to eq(1)
    end
  end

  context "user is not logged in" do

    scenario "adding a new cheet from the homepage when not logged in" do
      visit '/'
      expect(page).not_to have_content("Welcome hellokitty!")
      add_cheet("Hello world", Time.now, 1)
      expect(page).to have_content("You need to log in to post a cheet")
    end
  end

  def add_cheet(message,created_at,user_id)
    within("#post-cheet") do
      fill_in 'message', :with => message
      first('input#date', visible: false).set(Time.now.strftime("%m/%d/%y"))
      page.all("input[name=user_id]", :visible => false).first.set(1)
      click_button 'Post Cheet'
    end
  end

end