require 'spec_helper'


describe Phrase do

  let(:a1) { FactoryGirl.create(:user) }
  let(:e1) { FactoryGirl.create(:user) }
  before do
  	@phrase = a1.authoredPhrases.build(phrase_text: "bad", editor_id: e1.id) 
  end

  subject { @phrase }

  it { should be_valid }

  it { should respond_to(:phrase_text) }
  it { should respond_to(:lang) }
  it { should respond_to(:frequency) }
  it { should respond_to(:level) }
  it { should respond_to(:author) }
  it { should respond_to(:editor) }

  its(:author) { should == a1 }
  
  describe "when adding user id is not present" do
    before { @phrase.author = nil }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user ids" do
      expect do
        Phrase.new(author: a1.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "with blank content" do
    before { @phrase.phrase_text = " " }
    it { should_not be_valid }
  end

  describe "overwrite with content that is not too long" do
    before { @phrase.phrase_text = "not2long" }
    it { should be_valid }
  end

  describe "with content that is too long" do
    before { @phrase.phrase_text = "a" * 256 }
    it { should_not be_valid }
  end


end

