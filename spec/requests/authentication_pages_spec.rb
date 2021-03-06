require 'spec_helper'

describe "AuthenticationPage" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }

  end
  describe "signin" do
    before { visit signin_path }
    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Sign in') }
    end
      describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_content(user.name) }

      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
      end
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end

      end
    end
   describe "visiting the ad index" do
     before {visit ads_path }
     it { should have_content('Sign in')}
   end
  end