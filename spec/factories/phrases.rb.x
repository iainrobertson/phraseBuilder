# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phrase do
    lang "MyString"
    pos_id 1
    register "MyString"
    properties "MyString"
    frequency 1
    level 1
    phrase_class "MyString"
    phrase_text "MyString"
    author_id 1
    editor_id 1
  end
end
