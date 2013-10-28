require 'spec_helper'

describe "VisitorPage" do
  describe "index page" do
    subject { page }
      before { visit ads_path }
    it { should have_content('All Ads')}
    it { should_not have_selector('Approved')}

  end
end
