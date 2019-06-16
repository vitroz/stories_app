module StoriesHelper

  def story_status(story)
    if story && story.status.present?
      story.status.downcase 
    else
      story.status = 'unnasigned'
    end
  end

  def story_status_upper(story)
    if story && story.status.present?
      story.status.upcase 
    end
  end

end
