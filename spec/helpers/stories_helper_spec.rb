require 'rails_helper'

RSpec.describe StoriesHelper, type: :helper do

  it "It should output the story's writer name (based on seeds)" do
  	story = Story.find(1)
    expect(story_writer(story)).to eq("Will")
  end

  it "It should output the story's reviewer name (based on seeds)" do
  	story = Story.find(1)
    expect(story_reviewer(story)).to eq("Susan")
  end

  it "It should output None (unnasigned reviewer) " do
  	story = Story.find(2)
    expect(story_reviewer(story)).to eq("None")
  end

  it "It should output None (unnasigned writer) " do
  	story = Story.find(2)
    expect(story_writer(story)).to eq("None")
  end

  it "It should story's status in uppercase " do
  	story = Story.find(1)
    expect(status_upper(story)).to eq("DRAFT")
  end

  it "It should enable content visualization on the homepage " do
  	story = Story.find_by(status_id: 7)
  	user = User.find(1)
    expect(story_body_visible(user,story)).to eq(true)
  end

  it "It should not enable content visualization on the homepage for users when story is not published" do
  	story = Story.find_by(status_id: 2)
  	user = User.find(5)
    expect(story_body_visible(user,story)).to eq(false)
  end

  it "It should enable comments publishment if story's body text is empty or story is in review" do
  	story = Story.find_by(status_id: 4)
    expect(comments_enabled(story)).to eq(true)
  end

  it "It should not enable comments publishment if story's body text is not empty or story is not in review" do
  	story = Story.find_by(status_id: 7)
    expect(comments_enabled(story)).to eq(false)
  end

  it "Should show writer and reviewer as combobox for selection" do
  	story = Story.find(2)
  	user = User.find(1)
    expect(writer_reviewer_area(user,story)).to eq('writer_combobox')
  end

  it "Should show writer and reviewer as text for visualization" do
  	story = Story.find(3)
  	user = User.find(1)
    expect(writer_reviewer_area(user,story)).to eq('writer_text')
  end

  it "Should show comment section if story is related to the user" do
  	story = Story.find(1)
  	user = User.find(1)
  	user2 = User.find(1)
  	user3 = User.find(1)
  	user_unrelated = User.find(5)
    expect(story_can_view_comments(story, user)).to eq(true)
    expect(story_can_view_comments(story, user2)).to eq(true)
    expect(story_can_view_comments(story, user3)).to eq(true)
    expect(story_can_view_comments(story, user_unrelated)).to eq(false)
  end

  it "Checks if story's writer is equals to current user logged in " do
  	story = Story.find(1)
  	user = User.find(2)
    expect(is_story_writer(story, user)).to eq(true)
  end

  it "Checks if story's body may be modified " do
  	story_draft = Story.find(1)
  	story_pending = Story.find(5)
  	story_unassigned = Story.find(2)
  	story_published = Story.find(7)
  	user_admin = User.find(1)
  	user = User.find(2)
    expect(story_is_editable(story_draft, user)).to eq(true)
    expect(story_is_editable(story_pending, user)).to eq(true)
    expect(story_is_editable(story_unassigned, user)).to eq(false)
    expect(story_is_editable(story_unassigned, user_admin)).to eq(true)
    expect(story_is_editable(story_published, user)).to eq(false)
  end

  it "User can request review" do
  	story_draft = Story.find(1)
  	story_pending = Story.find(5)
  	user = User.find(2)
  	reviewer = User.find(3)
    expect(can_request_review(story_draft, user)).to eq(true)
    expect(can_request_review(story_pending, user)).to eq(true)
    expect(can_request_review(story_pending, reviewer)).to eq(false)
  end

  it "Story is set to be reviewed" do
  	story_for_review = Story.find(3)
  	reviewer = User.find(3)
    expect(story_will_review(story_for_review, reviewer)).to eq(true)
  end

end
