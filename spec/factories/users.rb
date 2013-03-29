FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end

  end
  factory :phrase do
    phrase_text "Lorem ipsum"
    association :author, factory: :user, name: "aurthur"
    association :editor, factory: :user, name: "edith"
    level 1
    frequency 100
  end
  
end