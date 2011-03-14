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

      it "should not make a new user with invalid credentials" do
        lambda do
          visit new_user_session_path
          Devise::ImapAdapter.stub!(:valid_credentials?).and_return(false)
          fill_in "Email",    :with => "invalid@bar.com"
          fill_in "Password", :with => "badpassword"
          click_button
          response.should render_template('devise/sessions/new')
        end.should_not change(User, :count)
      end
    end

    describe "success" do
      it "should make a new user with valid credentials" do
        lambda do
          visit new_user_session_path
          Devise::ImapAdapter.stub!(:valid_credentials?).and_return(true)
          fill_in "Email",    :with => "foo@bar.com"
          fill_in "Password", :with => "letmein"
          click_button
          response.should render_template('page/private')
        end.should change(User, :count).by(1)
      end
    end
  end
end
