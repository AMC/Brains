require 'spec_helper'

describe User do
  
  before(:each) do
     @user = User.new
  end
  
  it "Should require Login" do
    @user.valid?.should_not == true
    @user.errors_on(:login).length.should == 2
    @user.login = "bob"
    @user.errors_on(:login).length.should == 0
  end
  
  it "Should not allow abnormal charachters in login" do
    @user.login = "b!b"
    @user.errors_on(:login).length.should == 1
    @user.errors_on(:login).first.should == "should use only letters, numbers, spaces, and .-_@ please."
  end
  
  it "Should not require atleast 3 charachter Logins" do
    @user.login = "bb"
    @user.errors_on(:login).length.should == 1
    @user.errors_on(:login).first.should == "is too short (minimum is 3 characters)"
  end
  
  it "Should require Email" do
    @user.errors_on(:email).length.should == 2
    @user.email = "test@test.com"
    @user.errors_on(:email).length == 0
  end
  
  it "Should Require Password" do
    @user.errors_on(:password).length.should == 1
    @user.password = "password"
    @user.errors_on(:password).length.should == 0
  end
  
  it "Should require Password to be 6 or more charachters" do
    @user.errors_on(:password).length.should == 1
    @user.errors_on(:password).first.should == "is too short (minimum is 4 characters)"
    @user.password = "password"
    @user.errors_on(:password).length.should == 0
  end
  
  it "Should Require Password Confirmation" do
    @user.errors_on(:password_confirmation).length.should == 1
    @user.password_confirmation = "password_confirmation"
    @user.errors_on(:password_confirmation).length.should == 0
  end
  
  it "Should require Password Confirmation to be 6 or more charachters" do
    @user.errors_on(:password_confirmation).length.should == 1
    @user.errors_on(:password_confirmation).first.should == "is too short (minimum is 4 characters)"
    @user.password_confirmation = "password_confirmation"
    @user.errors_on(:password_confirmation).length.should == 0
  end
  
  it "Should "

  
end