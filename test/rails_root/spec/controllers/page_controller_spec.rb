require 'spec_helper'

describe PageController do

  describe "GET 'public'" do
    it "should be successful" do
      get 'public'
      response.should be_success
    end
  end

#  describe "GET 'private'" do
#    it "should be successful" do
#      get 'private'
#      response.should be_success
#    end
#  end

end
