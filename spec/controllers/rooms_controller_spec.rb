require 'spec_helper'

describe RoomsController do

  def mock_room(stubs={})
    (@mock_room ||= mock_model(Room).as_null_object).tap do |room|
      room.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all rooms as @rooms" do
      Room.stub(:all) { [mock_room] }
      get :index
      assigns(:rooms).should eq([mock_room])
    end
  end

  describe "GET show" do
    it "assigns the requested room as @room" do
      Room.stub(:find).with("37") { mock_room }
      get :show, :id => "37"
      assigns(:room).should be(mock_room)
    end
  end

  describe "GET new" do
    it "assigns a new room as @room" do
      Room.stub(:new) { mock_room }
      get :new
      assigns(:room).should be(mock_room)
    end
  end

  describe "GET edit" do
    it "assigns the requested room as @room" do
      Room.stub(:find).with("37") { mock_room }
      get :edit, :id => "37"
      assigns(:room).should be(mock_room)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created room as @room" do
        Room.stub(:new).with({'these' => 'params'}) { mock_room(:save => true) }
        post :create, :room => {'these' => 'params'}
        assigns(:room).should be(mock_room)
      end

      it "redirects to the created room" do
        Room.stub(:new) { mock_room(:save => true) }
        post :create, :room => {}
        response.should redirect_to(room_url(mock_room))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved room as @room" do
        Room.stub(:new).with({'these' => 'params'}) { mock_room(:save => false) }
        post :create, :room => {'these' => 'params'}
        assigns(:room).should be(mock_room)
      end

      it "re-renders the 'new' template" do
        Room.stub(:new) { mock_room(:save => false) }
        post :create, :room => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested room" do
        Room.should_receive(:find).with("37") { mock_room }
        mock_room.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :room => {'these' => 'params'}
      end

      it "assigns the requested room as @room" do
        Room.stub(:find) { mock_room(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:room).should be(mock_room)
      end

      it "redirects to the room" do
        Room.stub(:find) { mock_room(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(room_url(mock_room))
      end
    end

    describe "with invalid params" do
      it "assigns the room as @room" do
        Room.stub(:find) { mock_room(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:room).should be(mock_room)
      end

      it "re-renders the 'edit' template" do
        Room.stub(:find) { mock_room(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested room" do
      Room.should_receive(:find).with("37") { mock_room }
      mock_room.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rooms list" do
      Room.stub(:find) { mock_room }
      delete :destroy, :id => "1"
      response.should redirect_to(rooms_url)
    end
  end

end
