require 'rails_helper'

RSpec.describe Story, type: :model do

  it { should belong_to(:creator)}
  it { should belong_to(:writer)}
  it { should belong_to(:reviewer)}
  it { should belong_to(:status)}
  it { should belong_to(:organization)}

  subject {
    described_class.new(headline: 'headline', body: 'body text', 
    	                creator_id: 1, writer_id: 2, reviewer_id: 3, status_id: 1, organization_id: 1)
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it "is not valid without a headline" do
  	subject.headline = nil
    expect(subject).to_not be_valid
  end

  it "is is valid without a body" do
  	subject.body = nil
    expect(subject).to be_valid
  end

  it "is not valid if the writer is the same as the reviewer" do
  	subject.writer_id = 2
  	subject.reviewer_id = 2
    expect(subject).to_not be_valid
  end


end
