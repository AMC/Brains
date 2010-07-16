require 'spec_helper'


describe "projects/show.html.erb" do
  before(:each) do
    @project = assign(:project, stub_model(Project,

      :title => "Title",

      :description => "Description",

      :finished => false


    ))

  end

  it "renders attributes in <p>" do
    render

    rendered.should contain("Title".to_s)

    rendered.should contain("Description".to_s)

    rendered.should contain(false.to_s)

  end
end
