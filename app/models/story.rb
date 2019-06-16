class Story < ApplicationRecord

  belongs_to :creator, class_name: 'User'
  belongs_to :writer, class_name: 'User', optional: true
  belongs_to :reviewer, class_name: 'User', optional: true

  has_many :comments

  validate :writer_reviewer_are_the_same

  def writer_reviewer_are_the_same
    errors.add(:must_be_different, "writer can't be the same as the reviewer") if self.writer == self.reviewer && (self.writer != nil && self.reviewer != nil)
  end

  def on_story_time
    self.created_at = self.created_at.strftime("%m/%d/%Y")
  end

end
