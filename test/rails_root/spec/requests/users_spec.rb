require 'spec_helper'

describe "Users" do
  describe "sign_in" do
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit new_user_session_path
          fill_in "Email",    :with => ""
          fill_in "Password", :with => ""
          click_button
          response.should render_template('devise/sessions/new')
        end.should_not change(User, :count)
      end
    end
  end
end
