class CommentsController < ApplicationController
  
  before_filter :find_commentable
  
  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @commentable
    else
      redirect_to @commentable
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return @commentable = $1.classify.constantize.find(value)
      end
    end
    return nil
  end
  
end
