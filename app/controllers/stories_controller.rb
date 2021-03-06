class StoriesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @search = Story.ransack(params[:q])
    @stories = @search.result.order(created_at: :asc).page(params[:page]).where(["organization_id = :organization_id", { organization_id: current_user.organization_id, }])
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
    authorize! :update, @story
  end

  def create
    @story = Story.new(story_params)
    @story.creator = current_user
    @story.organization_id = current_user.organization_id

    if @story.save

      advance_story @story

      redirect_to stories_path
    else
      render 'stories/new'
    end
  end

  def update
    @story = Story.find(params[:id])   

    if @story.update(story_params)
      advance_story @story

      redirect_to stories_path
    else
      render 'edit'
    end

  end

  def update_story_status_event
    story = Story.find(params['story_id'])
    sub_action = params['sub_action']

    advance_story story, sub_action

    redirect_to stories_path
  end

  private

    def story_params
      params.require(:story).permit(:headline, :body, :writer_id, :reviewer_id)
    end

    def advance_story(story, sub_action = nil)

      next_state = StoryStateService.new(story, current_user, sub_action).call

      if next_state
        story.update status_id: next_state
      end

    end

end
