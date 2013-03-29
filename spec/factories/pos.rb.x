# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :po, :class => 'Pos' do
    pos_detail "MyString"
    pos_class "MyString"
  end
end
