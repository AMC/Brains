require 'spec_helper'

describe Task do
  
  before(:each) do
    @task = Task.new
  end
  
  it "Should have a name" do
    @task.valid?.should == false
    @task.errors_on(:name).length.should == 1
    @task.errors_on(:name).first.should == "can't be blank"
    @task.name = "Hello there"
    @task.errors_on(:name).length.should == 0
  end
  
  it "Should have a description" do
    @task.valid?.should == false
    @task.errors_on(:description).length.should == 1
    @task.errors_on(:description).first.should == "can't be blank"
    @task.description = "Lorem ispum dolor"
    @task.errors_on(:description).length.should == 0
  end
  
  it "Should have a priority level and should be numerical" do
    @task.errors_on(:priority).length.should == 1
    @task.errors_on(:priority).first.should == " is not an accepted priority"
    @task.priority = 11
    @task.errors_on(:priority).first.should == "11 is not an accepted priority"
    @task.priority = 0
    @task.errors_on(:priority).first.should == "0 is not an accepted priority"
    @task.priority = 5
    @task.errors_on(:priority).length.should == 0
  end
  
  it "Should be able to be marked finished" do
    @task.finish!.should == false
    @task = Task.create(:name=>"Hello",:description=>"Hello Again",:priority=>7)
    @task.valid?.should == true
    @task.date_finished.should == nil
    @task.finish!.should == true
    @task.date_finished.should == Date.today
    @task.finished.should == true
  end
  
  it "Should know time spent on self" do
    @task.description = "Desc..."
    @task.name = "..."
    @task.priority = 7
    @task.save
    @task.time_spent.should == 0
    @user = User.create(:login=>"Will",:password=>"password", :password_confirmation=>"password", :email=>"will@Willgretz.com")
    Timesheet.create(:start_time=>Time.now-1.hour, :tasks=>[@task], :end_time=>Time.now, :user=>@user)
      @task.time_spent.should == 60
    Timesheet.create(:start_time=>Time.now-2.hour, :tasks=>[@task], :end_time=>Time.now-3.hour, :user=>@user)
      @task.time_spent.should == 120
  end
  
end
