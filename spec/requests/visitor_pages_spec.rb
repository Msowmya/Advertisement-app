require 'spec_helper'

describe "VisitorPage" do
  describe "index page" do
    it "should take me to  the index page" do
      visit ads_path
      expect(page).to have_content('All Advertisements')
    end
  end
end
