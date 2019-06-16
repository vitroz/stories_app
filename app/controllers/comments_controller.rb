class CommentsController < ApplicationController

  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(comment_params)

    next_state = StoryStateService.new(@story, current_user, 'comment').call

    if next_state
      @story.update_column(:status, next_state)
    end
    
    redirect_to stories_path(@story)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end	
end
