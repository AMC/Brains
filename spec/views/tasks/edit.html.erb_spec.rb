require 'spec_helper'

describe "tasks/edit.html.erb" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :new_record? => false,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit task form" do
    render

    rendered.should have_selector("form", :action => task_path(@task), :method => "post") do |form|
      form.should have_selector("input#task_name", :name => "task[name]")
      form.should have_selector("input#task_description", :name => "task[description]")
    end
  end
end
