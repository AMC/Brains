require 'spec_helper'

describe "tasks/new.html.erb" do
  before(:each) do
    assign(:task, stub_model(Task,
      :new_record? => true,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new task form" do
    render

    rendered.should have_selector("form", :action => tasks_path, :method => "post") do |form|
      form.should have_selector("input#task_name", :name => "task[name]")
      form.should have_selector("input#task_description", :name => "task[description]")
    end
  end
end
