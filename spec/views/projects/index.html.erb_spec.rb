require 'spec_helper'


describe "projects/index.html.erb" do
  before(:each) do
    assign(:projects, [

      stub_model(Project,

        :title => "Title",

        :description => "Description",

        :finished => false


      ),


      stub_model(Project,

        :title => "Title",

        :description => "Description",

        :finished => false


      )


    ])
  end

  it "renders a list of projects" do
    render

    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)

    rendered.should have_selector("tr>td", :content => "Description".to_s, :count => 2)

    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)

  end
end
