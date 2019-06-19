module StoriesHelper

  def story_body_visible(user,story)
    return story.status.name == 'published' || (user.id == story.creator_id || user.id == story.writer_id || user.id == story.reviewer_id)
  end

  def comments_enabled(story)
    story.body == nil || story.status.name == 'in_review'
  end

  def status_upper(story)
    if story && story.status.present?
      story.status.name.upcase.tr('_', ' ')
    end
  end

  def status(story)
    if story && story.status.present?
      story.status.name.downcase
    end
  end

  def story_writer(story)
    if story && story.writer.present?
      story.writer.name
    else
      'None'
    end
  end

  def story_reviewer(story)
    if story && story.reviewer.present?
      story.reviewer.name
    else
      'None'
    end
  end

  def writer_reviewer_area(user,story)
    if user.role.super_admin && story.status.name == 'unassigned'
      'writer_combobox'
    else
      'writer_text'
    end
  end

  def story_can_view_comments(story, user)
    return story.id != nil && (user.id == story.creator_id || user.id == story.writer_id || user.id == story.reviewer_id)
  end

  def is_story_writer(story, user)
    return story.writer_id == user.id
  end

  def story_is_editable(story, user)
    return (story.writer_id == user.id || user.role.super_admin) && (story.status.name == 'draft'|| story.status.name == 'pending' || story.status.name == 'unassigned')
  end

  def can_request_review(story, user)
    return story.id != nil && (story.status.name == 'draft' || story.status.name == 'pending') && user.id != story.reviewer_id && story.body != nil
  end

  def story_will_review(story, user)
    return story.status.name == 'for_review' && story.reviewer_id == user.id || (user.role.super_admin && story.status.name == 'for_review')
  end

  def story_is_in_review(story, user)
    return story.status.name == 'in_review' && story.reviewer_id == user.id || (user.role.super_admin && story.status.name == 'in_review')
  end

  def story_is_approved_by_reviewer(story, user)
    return user.role.super_admin && story.id != nil && story.status.name == 'approved'
  end

end
