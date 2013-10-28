require 'spec_helper'

describe "AdPage" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "index" do
    before do
      sign_in FactoryGirl.create(:ad)
      FactoryGirl.create(:ad, title: "Bob")
      FactoryGirl.create(:ad, title: "Ben")
      visit ads_path
    end

    #it { should have_title('All Ads') }
    it { should have_content('All Ads') }

    it "should list each ad" do
      Ad.all.each do |ad|
        expect(page).to have_selector('li', text: ad.title)
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

      before { fill_in 'ad_title', with: "Lorem ipsum" }
      it "should create a ad" do
        expect { click_button "Post" }.to change(Ad, :count).by(1)
      end
    end
  end

end
