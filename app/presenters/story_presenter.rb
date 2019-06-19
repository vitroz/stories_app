class StoryPresenter < ApplicationPresenter

  def initialize(model)
    @model = model
    super(@model)
  end

  def writer
    defined?(@model.writer.name) ? @model.writer.name : 'None'
  end

  def reviewer
    defined?(@model.reviewer.name) ? @model.reviewer.name : 'None'
  end

  def on_story_time
    @model.created_at = @model.created_at.strftime("%m/%d/%Y")
  end

  def status_upper
    if @model && @model.status.present?
      @model.status.name.upcase.tr('_', ' ')
    end
  end

  def status
    if @model && @model.status.present?
      @model.status.name.downcase
    end
  end

  def card_partial(user)
    if @model.status.name == 'published' || (user.id == @model.creator_id || user.id == @model.writer_id || user.id == @model.reviewer_id)
      'full_story'
    else
      'story_headline'
    end
  end

end