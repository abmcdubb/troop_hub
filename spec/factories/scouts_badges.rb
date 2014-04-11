# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scouts_badge, :class => 'ScoutsBadges' do
    scout nil
    badge nil
  end
end
