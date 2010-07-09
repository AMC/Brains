require 'spec_helper'

describe "timesheets/show.html.erb" do
  before(:each) do
    @timesheet = assign(:timesheet, stub_model(Timesheet))
  end

  it "renders attributes in <p>" do
    render
  end
end
