require 'spec_helper'

describe Timesheet do
  
  before(:each) do
    @timesheet = Timesheet.new
    @user = User.create(:login=>"JST",:password=>"password",:password_confirmation=>"password",:email=>"JST@WillGretz.com")
    @task = Task.create(:name=>"Test Task 1", :description=>"Lorem Ipsum Dolor Set Amet", :priority=>7)
  end
  
  it "Should have a user associated to it" do
    @timesheet.valid?.should == false
    @timesheet.errors_on(:user_id).length.should == 1
    @timesheet.user = @user
    @timesheet.errors_on(:user_id).length.should == 0
  end
  
  it "Should have a start time" do
    @timesheet.start_time.nil?.should == false
    @timesheet.start_time.to_date.should == Date.today
  end
  
  it "Should be open if there is no end time" do
    @timesheet.start_time.nil?.should == false
    @timesheet.end_time.nil?.should == true
    @timesheet.open?.should == true
    @timesheet.end!.should == false
    @timesheet.user = @user
    @timesheet.save
    @timesheet.tasks << @task
    @timesheet.end!.should == true
    @timesheet.end_time.nil?.should == false
    @timesheet.end_time.to_date.should == Date.today
  end
  
  it "Should have a task associated to it" do
    @timesheet.user = @user
    @timesheet.save.should == true
    @timesheet.end!.should == false
    @timesheet.errors_on(:tasks).length.should == 1
    @timesheet.tasks << @task
    @timesheet.end!.should == true
  end
  
  it "Should not allow an end time earlier then start time." do
    @timesheet.user = @user
    @timesheet.save.should == true
    @timesheet.tasks << @task
    @timesheet.end!(Time.now-2.days).should == false
    @timesheet.errors_on(:base).length.should == 1
    @timesheet.errors_on(:base).first.should == "end date must come after start date"
    @timesheet.end!.should == true
  end
  
  it "Should not allow an end time in the future" do
    @timesheet.user = @user
    @timesheet.save.should == true
    @timesheet.tasks << @task
    @timesheet.end!(Time.now+1.day).should == false
    @timesheet.errors_on(:end_time).length.should == 1
    @timesheet.errors_on(:end_time).first.should == "Must not be a future time"
  end
  
  it "Should not allow a start time in the future" do
    @timesheet.start_time += 1.day
    @timesheet.save.should == false
    @timesheet.errors_on(:start_time).length.should == 1
    @timesheet.errors_on(:start_time).first.should == "Must not be a future time"
    @timesheet.start_time = Time.now
  end
  
  it "Should know it's length if closed" do
    @timesheet.start_time = Time.now - 1.hour
    @timesheet.end!(@timesheet.start_time + 30.minutes)
    @timesheet.time_spent.should == 30
  end
  
  it "Should have only one open timesheet for a given user" do
    @timesheet.user = @user
    @timesheet.tasks << @task
    @timesheet.save
    @timesheet2 = Timesheet.new
    @timesheet2.tasks << @task
    @timesheet2.user = @user
    @timesheet2.valid?.should == false
  end
  
end
