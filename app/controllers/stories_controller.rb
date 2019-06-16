class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
  end

  def index
  	@stories = Story.all
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
    authorize! :update, @story
  end

  def show
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(story_params)
    @story.creator = current_user
    @story.writer = nil
    @story.reviewer = nil
    @story.status = :unnasigned
    if @writer = User.find_by_id(story_params['writer_id'])
      @story.writer = @writer
      @story.status = :draft
    end
    if @reviewer = User.find_by_id(story_params['reviewer_id'])
      @story.reviewer = @reviewer
    end

    if @story.save
      redirect_to stories_path
    else
      render json: {code: 500, message: @story.errors.messages}
    end
  end

  def update
    @story = StoryService.new(params).call
   
    if @story.update(story_params)
      
      next_state = StoryStateService.new(@story, current_user, nil).call

      if next_state 
        @story.update_column(:status, next_state) 
      end  
      redirect_to stories_path
    else
      render 'edit'
    end
  end

  def update_story_status_event
    story = Story.find(params['story_id'])
    sub_action = params['sub_action']

    next_state = StoryStateService.new(story, current_user, sub_action).call

    if next_state 
      story.update_column(:status, next_state) 
    end

    redirect_to stories_path
  end

  private

    def story_params
      params.require(:story).permit(:headline, :body, :writer_id, :reviewer_id)
    end

end
