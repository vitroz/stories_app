require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  should belong_to(:creator).class_name('User').with_foreign_key('creator_id')
  should belong_to(:writer).class_name('User').with_foreign_key('writer_id')
  should belong_to(:reviewer).class_name('User').with_foreign_key('reviewer_id')
end
