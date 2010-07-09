require 'spec_helper'

describe TimesheetsController do

  def mock_timesheet(stubs={})
    @mock_timesheet ||= mock_model(Timesheet, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all timesheets as @timesheets" do
      Timesheet.stub(:all) { [mock_timesheet] }
      get :index
      assigns(:timesheets).should eq([mock_timesheet])
    end
  end

  describe "GET show" do
    it "assigns the requested timesheet as @timesheet" do
      Timesheet.stub(:find).with("37") { mock_timesheet }
      get :show, :id => "37"
      assigns(:timesheet).should be(mock_timesheet)
    end
  end

  describe "GET new" do
    it "assigns a new timesheet as @timesheet" do
      Timesheet.stub(:new) { mock_timesheet }
      get :new
      assigns(:timesheet).should be(mock_timesheet)
    end
  end

  describe "GET edit" do
    it "assigns the requested timesheet as @timesheet" do
      Timesheet.stub(:find).with("37") { mock_timesheet }
      get :edit, :id => "37"
      assigns(:timesheet).should be(mock_timesheet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created timesheet as @timesheet" do
        Timesheet.stub(:new).with({'these' => 'params'}) { mock_timesheet(:save => true) }
        post :create, :timesheet => {'these' => 'params'}
        assigns(:timesheet).should be(mock_timesheet)
      end

      it "redirects to the created timesheet" do
        Timesheet.stub(:new) { mock_timesheet(:save => true) }
        post :create, :timesheet => {}
        response.should redirect_to(timesheet_url(mock_timesheet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved timesheet as @timesheet" do
        Timesheet.stub(:new).with({'these' => 'params'}) { mock_timesheet(:save => false) }
        post :create, :timesheet => {'these' => 'params'}
        assigns(:timesheet).should be(mock_timesheet)
      end

      it "re-renders the 'new' template" do
        Timesheet.stub(:new) { mock_timesheet(:save => false) }
        post :create, :timesheet => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested timesheet" do
        Timesheet.should_receive(:find).with("37") { mock_timesheet }
        mock_timesheet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :timesheet => {'these' => 'params'}
      end

      it "assigns the requested timesheet as @timesheet" do
        Timesheet.stub(:find) { mock_timesheet(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:timesheet).should be(mock_timesheet)
      end

      it "redirects to the timesheet" do
        Timesheet.stub(:find) { mock_timesheet(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(timesheet_url(mock_timesheet))
      end
    end

    describe "with invalid params" do
      it "assigns the timesheet as @timesheet" do
        Timesheet.stub(:find) { mock_timesheet(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:timesheet).should be(mock_timesheet)
      end

      it "re-renders the 'edit' template" do
        Timesheet.stub(:find) { mock_timesheet(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested timesheet" do
      Timesheet.should_receive(:find).with("37") { mock_timesheet }
      mock_timesheet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the timesheets list" do
      Timesheet.stub(:find) { mock_timesheet(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(timesheets_url)
    end
  end

end
