FactoryBot.define do
  factory :comment do
    user { FactoryBot.create(:user) }
    project { FactoryBot.create(:project) }
    sequence(:content) { |i| "Content numero #{i}" }
  end
end
