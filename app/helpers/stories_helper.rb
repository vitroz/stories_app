module StoriesHelper

  def story_status(story)
    if story && story.status.present?
      story.status.downcase 
    end
  end

  def story_status_upper(story)
    if story && story.status.present?
      story.status.upcase 
    else
      'UNASSIGNED'
    end
  end

end
