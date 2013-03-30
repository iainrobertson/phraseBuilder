require 'spec_helper'

describe "PhrasePages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { do_valid_signin user }

  describe "phrase creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a phrase" do
        expect { click_button "Post" }.not_to change(Phrase, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'phrase_phrase_text', with: "Lorem ipsum" }
      it "should create a phrase" do
        expect { click_button "Post" }.to change(Phrase, :count).by(1)
      end
    end
  end

  describe "phrase destruction" do
    before { FactoryGirl.create(:phrase, author: user, phrase_text: "about to delete this", editor: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a phrase" do
        expect { click_link "delete" }.to change(Phrase, :count).by(-1)
      end
    end
  end

end
