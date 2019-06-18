module StoriesHelper

  def story_status(story)
    if story && story.status.present?
      story.status.name.downcase
    end
  end

  def story_status_upper(story)
    if story && story.status.present?
      story.status.name.upcase.tr('_', ' ')
    end
  end

end
