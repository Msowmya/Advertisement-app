require 'spec_helper'

describe "UserPage", :type => :feature do
  subject { page }
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    #let!(:m1) { FactoryGirl.create(:ad, user: user, title: "Foo") }
    #let!(:m2) { FactoryGirl.create(:ad, user: user, title: "Bar") }


    before { visit user_path(user) }

    it { should have_content(user.name) }
    describe "ads" do
      #it { should have_title(m1.title)}
     # it { should have_title(m2.title)}
      #it { should have_title(user.ads.count)}

    end

  end


  describe "signup page" do
    before { visit signup_path }

    it { should have_content('SignUp Here') }

  end
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end


end
