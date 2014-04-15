# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_badge, :class => 'UserBadges' do
    user nil
    badge nil
  end
end
