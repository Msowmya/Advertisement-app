require 'spec_helper'

describe "UserPage", :type => :feature do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('SignUp Here') }

  end

end
