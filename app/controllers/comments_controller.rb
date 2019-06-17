class CommentsController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(comment_params)
    
    redirect_to edit_story_path(@story)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end	
end
