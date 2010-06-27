class ProblemsController < ApplicationController
  before_filter :require_user
  before_filter :owns_problem, :only => [:edit, :update, :destroy]
  uses_tiny_mce  :only => [:new, :create, :edit, :update],
                           :options => {
                           :theme => 'advanced',
                           :theme_advanced_toolbar_location => "top",
                           :theme_advanced_toolbar_align => "left",
                           :theme_advanced_resizing => true,
                           :theme_advanced_resize_horizontal => false,
                           :plugins => %w{ table fullscreen }
                           }



  def index
    @problems = Problem.all
  end
  
  def show
    @problem = Problem.find(params[:id])
  end
  
  def new
    @problem = Problem.new
  end
  
  def create
    @problem = Problem.new(params[:problem])
    @problem.user_id = current_user.id
    if @problem.save
      flash[:notice] = "Successfully created problem."
      redirect_to @problem
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @problem.update_attributes(params[:problem])
      flash[:notice] = "Successfully updated problem."
      redirect_to @problem
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @problem.destroy
    flash[:notice] = "Successfully destroyed problem."
    redirect_to problems_url
  end
  
  private 
    def owns_problem
      @problem = Problem.find(params[:id]) 
      return current_user.id == @problem.user_id 
    end
  
  
end
