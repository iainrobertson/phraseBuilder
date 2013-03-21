FactoryGirl.define do
  factory :user do
    name     "Test Username"
    email    "test@email.com"
    password "foobar"
    password_confirmation "foobar"
  end
end