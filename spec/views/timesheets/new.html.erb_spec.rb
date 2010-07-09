require 'spec_helper'

describe "timesheets/new.html.erb" do
  before(:each) do
    assign(:timesheet, stub_model(Timesheet,
      :new_record? => true
    ))
  end

  it "renders new timesheet form" do
    render

    rendered.should have_selector("form", :action => timesheets_path, :method => "post") do |form|
    end
  end
end
