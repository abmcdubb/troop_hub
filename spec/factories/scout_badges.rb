# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scout_badge, :class => 'ScoutBadges' do
    scout_id 1
    badge_id 1
  end
end
