require 'spec_helper'


describe "projects/edit.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :new_record? => false,

      :title => "MyString",

      :description => "MyString",

      :finished => false

    ))
  end

  it "renders the edit project form" do
    render

    rendered.should have_selector("form", :action => project_path(@project), :method => "post") do |form|

      form.should have_selector("input#project_title", :name => "project[title]")

      form.should have_selector("input#project_description", :name => "project[description]")

      form.should have_selector("input#project_finished", :name => "project[finished]")

    end
  end
end
