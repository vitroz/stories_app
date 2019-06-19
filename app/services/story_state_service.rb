class StoryStateService

  STATUS = [UNASSIGNED = 1, DRAFT = 2, FOR_REVIEW = 3, IN_REVIEW = 4, PENDING = 5, APPROVED = 6, PUBLISHED = 7, ARCHIVED = 8]

  def initialize(story, current_user, sub_action)
    @story = story
    @options = {:story => story, :user => current_user, :sub_action => sub_action}
  end

  def call

    StoryStateService.public_send(@story.status.name, @options)

  end

  def self.unassigned(options)
    if(options[:story].writer != nil && options[:story].creator.id == options[:user].id)
      next_state = StoryStateService::DRAFT
    end
  end

  def self.draft(options)
    if(options[:story].writer.id == options[:user].id && options[:sub_action] == 'REQUEST REVIEW')
      next_state = StoryStateService::FOR_REVIEW
    end
  end

  def self.for_review(options)    
      next_state = StoryStateService::IN_REVIEW
  end

  def self.in_review(options) 
    if options[:sub_action] == 'APPROVE' && (options[:story].reviewer.id == options[:user].id || options[:story].creator.id == options[:user].id)
      next_state = StoryStateService::APPROVED
    else
      next_state = StoryStateService::PENDING
    end
  end

  def self.pending(options)
    if(options[:story].writer.id == options[:user].id && options[:sub_action] == 'REQUEST REVIEW')
      next_state = StoryStateService::FOR_REVIEW
    else
      next_state = StoryStateService::DRAFT
    end
  end

  def self.approved(options) 
    if (options[:sub_action] == 'PUBLISH' && options[:story].creator.id == options[:user].id)
      next_state = StoryStateService::PUBLISHED
    else
      next_state = StoryStateService::ARCHIVED
    end  
  end


end