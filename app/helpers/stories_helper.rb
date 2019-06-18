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

  def story_body_visible(user,story)
    return story.status.name == 'published' || (user.id == story.creator_id || user.id == story.writer_id || user.id == story.reviewer_id)
  end

  def comments_enabled(story)
    story.body == nil || story.status.name == 'in_review'
  end

end
