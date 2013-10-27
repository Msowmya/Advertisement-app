require 'spec_helper'

describe "HomePage", :type => :feature do
  describe "When I visit the homepage" do
    it "should have a signup path" do
      visit signup_path
      expect(page).to have_content("SignUp Here")
    end
  end
end
