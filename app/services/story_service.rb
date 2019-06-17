class StoryService

  def initialize(params)
    @story = Story.new(params['story'])
  	if params['id']
      @story = Story.find(params['id'])
    end
    @writer = User.find_by(params['writer_id'])
    @reviewer = User.find_by(params['reviewer_id'])
  end

  def call
    @story
  end

end 