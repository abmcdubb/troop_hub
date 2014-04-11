# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo, :class => 'Photos' do
    pic "MyString"
    hovertext "MyString"
    photoable_id 1
    photoable_type "MyString"
  end
end
