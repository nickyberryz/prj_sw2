require 'spec_helper'

describe StaticPagesController do

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

end
