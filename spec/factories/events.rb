# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    grades "MyString"
    badges "MyString"
    genre "MyString"
    description "MyText"
    season "MyString"
    one_time "MyString"
    location "MyString"
  end
end
