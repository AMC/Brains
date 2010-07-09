require 'spec_helper'

describe "timesheets/edit.html.erb" do
  before(:each) do
    @timesheet = assign(:timesheet, stub_model(Timesheet,
      :new_record? => false
    ))
  end

  it "renders the edit timesheet form" do
    render

    rendered.should have_selector("form", :action => timesheet_path(@timesheet), :method => "post") do |form|
    end
  end
end
