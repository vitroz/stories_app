class Story < ApplicationRecord

  belongs_to :creator, class_name: 'User'
  belongs_to :writer, class_name: 'User', optional: true
  belongs_to :reviewer, class_name: 'User', optional: true
  belongs_to :status

  has_many :comments

  validate :writer_reviewer_are_the_same
  validates :headline, presence: true

  after_initialize :init

  paginates_per 4

  def writer_reviewer_are_the_same
    errors.add(:must_be_different, " - writer can't be the same as the reviewer") if self.writer == self.reviewer && (self.writer != nil && self.reviewer != nil)
  end

  def on_story_time
    self.created_at = self.created_at.strftime("%m/%d/%Y")
  end

  def init
    self.status ||= Status.find_by(name: 'unassigned')
  end

end
