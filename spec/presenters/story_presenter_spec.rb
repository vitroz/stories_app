require 'rails_helper'

RSpec.describe StoryPresenter, type: :presenter do

  let(:story) { Story.find(1) }
  subject(:presenter) { described_class.new(story) }

  let(:story_unnasigned) { Story.find(2) }
  subject(:presenter_story_unassigned) { described_class.new(story_unnasigned) }

  let(:story_published) { Story.find(7) }
  let(:admin) { User.find(1) }
  let(:user_unrelated) { User.find(5) }
  subject(:presenter_story_published) { described_class.new(story_published) }


  it { expect(story.headline).to eq("Draft Story Sample") }

  describe "#writer" do
    it "returns the story's writer" do
      expected = 'Will'
      expect(presenter.writer).to eq(expected)
    end

    it "returns None" do
      expect(presenter_story_unassigned.writer).to eq('None')
    end
  end

  describe "#reviewer" do
    it "returns the story's reviewer" do
      expected = 'Susan'
      expect(presenter.reviewer).to eq(expected)
    end

    it "returns None" do
      expect(presenter_story_unassigned.reviewer).to eq('None')
    end
  end

  describe "#story card partial" do
    it "returns the story's full card partial" do
      expected = 'full_story'
      expect(presenter.card_partial(admin)).to eq(expected)
    end
    it "returns the story's with no content card partial" do
      expected = 'story_headline'
      expect(presenter.card_partial(user_unrelated)).to eq(expected)
    end
  end


end
