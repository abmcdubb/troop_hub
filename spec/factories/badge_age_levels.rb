# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :badge_age_level, :class => 'BadgeAgeLevels' do
    badge nil
    age_level nil
  end
end
