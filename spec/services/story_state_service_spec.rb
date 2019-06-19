require 'rails_helper'

RSpec.describe StoryStateService, type: :service do

  let(:story_unassigned) { Story.find(2) }
  let(:story_creator) { User.find(1) }
  subject(:service_unassigned) { described_class.new(story_unassigned, story_creator, nil) }

  let(:story_draft) { Story.find(1) }
  let(:story_writer) { User.find(2) }
  let(:story_reviewer) { User.find(3) }
  let(:sub_action) { 'REQUEST REVIEW' }
  subject(:service_draft) { described_class.new(story_draft, story_writer, sub_action) }

  let(:story_for_review) { Story.find(3) }
  subject(:service_for_review) { described_class.new(story_for_review, story_writer, nil) }

  let(:story_in_review_pending) { Story.find(4) }
  let(:sub_action_req_review) { 'REQUEST REVIEW' }
  subject(:service_in_review_pending) { described_class.new(story_in_review_pending, story_writer, sub_action_req_review) }

  let(:story_in_review) { Story.find(4) }
  let(:sub_action_approve) { 'APPROVE' }
  subject(:service_in_review_approve) { described_class.new(story_in_review, story_reviewer, sub_action_approve) }

  let(:story_approved) { Story.find(6) }
  let(:sub_action_publish) { 'PUBLISH' }
  subject(:service_approved_publish) { described_class.new(story_approved, story_creator, sub_action_publish) }

  let(:sub_action_archive) { 'ARCHIVE' }
  subject(:service_approved_archive) { described_class.new(story_approved, story_creator, sub_action_archive) }


  describe "#Story being on a unassigned stage, should go to Draft State, if requested " do
    it "returns the story's new status going from unassigned" do
      story_unassigned.writer = story_writer
      expected = 2
      expect(service_unassigned.call).to eq(expected)
    end

  end

  describe "#Story being on a draft stage, should go to For Review State, if requested " do
    it "returns the story's new status going from draft" do
      expected = 3
      expect(service_draft.call).to eq(expected)
    end

  end

  describe "#Story being on a for review stage, should go to For In Review State, if requested " do
    it "returns the story's new status going from for review" do
      expected = 4
      expect(service_for_review.call).to eq(expected)
    end

  end

  describe "#Story being on a in review stage, should go to a Pending State, if marked as request changes " do
    it "returns the story's new status going from in review - request change" do
      expected = 5
      expect(service_in_review_pending.call).to eq(expected)
    end

  end

  describe "#Story being on a in review stage, should go to Approved State, if approved " do
    it "returns the story's new status going from in review - request change" do
      expected = 6
      expect(service_in_review_approve.call).to eq(expected)
    end

  end

  describe "#Story being on a approved stage, should go to Published, if chief editor decides to publish it " do
    it "returns the story's new status going from approved - publish" do
      expected = 7
      expect(service_approved_publish.call).to eq(expected)
    end

  end

  describe "#Story being on a approved stage, should go to Archied, if chief editor decides to archive it " do
    it "returns the story's new status going from approved - archive" do
      expected = 8
      expect(service_approved_archive.call).to eq(expected)
    end

  end

end
