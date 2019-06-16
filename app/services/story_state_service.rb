class StoryStateService

  def initialize(story, current_user, sub_action)
    @story = story
    @options = {:story => story, :user => current_user, :sub_action => sub_action}
  end

  def call

    StoryStateService.public_send(@story.status, @options)

  end

  def self.unnasigned(options)
    if(options[:story].writer != nil && options[:story].creator.id == options[:user].id)
      next_state = :draft
    end
  end

  def self.draft(options)
    if(options[:story].writer.id == options[:user].id && options[:sub_action] == 'REQUEST REVIEW')
      next_state = :for_review
    end
  end

  def self.for_review(options)    
    if (options[:story].reviewer.id == options[:user].id)
      next_state = :in_review
    end
  end

  def self.in_review(options) 
    if options[:sub_action] == 'APPROVE' 
      next_state = :approved
    elsif options[:sub_action] == 'REQUEST CHANGES' 
      next_state = :pending
    end
  end

  def self.pending(options)
    if(options[:story].writer.id == options[:user].id && options[:sub_action] == 'REQUEST REVIEW')
      next_state = :for_review
    end
  end

  def self.approved(options) 
    if (options[:sub_action] == 'PUBLISH' && options[:story].creator.id == options[:user].id)
      next_state = :published
    else
      next_state = :archived
    end  
  end


end