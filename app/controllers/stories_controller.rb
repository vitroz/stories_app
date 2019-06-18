class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:home]

  def home
  end

  def index 
    @search = Story.search(params[:q])
    @stories = @search.result.order(created_at: :asc).page(params[:page])
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

    if @story.save
      next_state = StoryStateService.new(@story, current_user, nil).call

      if next_state 
        @story.update_column(:status_id, next_state) 
      end 

      redirect_to stories_path
    else
      render 'stories/new'
    end
  end

  def update
    @story = Story.find(params[:id])   

    if @story.update(story_params)
      
      next_state = StoryStateService.new(@story, current_user, nil).call

      if next_state 
        @story.update_column(:status_id, next_state) 
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
      story.update_column(:status_id, next_state) 
    end

    redirect_to stories_path
  end

  private

    def story_params
      params.require(:story).permit(:headline, :body, :writer_id, :reviewer_id)
    end

end
