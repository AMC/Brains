require 'spec_helper'


describe "projects/new.html.erb" do
  before(:each) do
    assign(:project, stub_model(Project,
      :new_record? => true,

      :title => "MyString",

      :description => "MyString",

      :finished => false

    ))
  end

  it "renders new project form" do
    render

    rendered.should have_selector("form", :action => projects_path, :method => "post") do |form|

      form.should have_selector("input#project_title", :name => "project[title]")

      form.should have_selector("input#project_description", :name => "project[description]")

      form.should have_selector("input#project_finished", :name => "project[finished]")

    end
  end
end
