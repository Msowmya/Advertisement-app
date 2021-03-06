require 'spec_helper'

describe "AdPage" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  #before { sign_in user }
  describe "index" do
    before { visit ads_path}
    it { should have_content('All Ads') }

    it "should list each ad" do
      Ad.all.each do |ad|
        expect(page).to have_selector( text: ad.title)
      end
    end

  end

  describe "ad creation" do
    before { visit root_path }
    describe "with invalid information" do

      it "should not create a ad" do
        expect { click_button "Post" }.not_to change(Ad, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'ad.title', with: "Lorem ipsum" }
      it "should create a ad" do
        expect { click_button "Post" }.to change(Ad, :count).by(1)
      end
    end
  end

end
