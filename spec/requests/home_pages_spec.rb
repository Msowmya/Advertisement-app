require 'spec_helper'

describe "HomePage", :type => :feature do
  describe "When I visit the homepage" do
    it "should have a welcome message" do
      visit root_path
      expect(page).to have_content("Welcome to my website")
    end
  end
end
