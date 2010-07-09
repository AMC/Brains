require "spec_helper"

describe TimesheetsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/timesheets" }.should route_to(:controller => "timesheets", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/timesheets/new" }.should route_to(:controller => "timesheets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/timesheets/1" }.should route_to(:controller => "timesheets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/timesheets/1/edit" }.should route_to(:controller => "timesheets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/timesheets" }.should route_to(:controller => "timesheets", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/timesheets/1" }.should route_to(:controller => "timesheets", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/timesheets/1" }.should route_to(:controller => "timesheets", :action => "destroy", :id => "1") 
    end

  end
end
