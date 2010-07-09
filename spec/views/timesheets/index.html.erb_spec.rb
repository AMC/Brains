require 'spec_helper'

describe "timesheets/index.html.erb" do
  before(:each) do
    assign(:timesheets, [
      stub_model(Timesheet),
      stub_model(Timesheet)
    ])
  end

  it "renders a list of timesheets" do
    render
  end
end
