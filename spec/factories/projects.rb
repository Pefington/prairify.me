FactoryBot.define do
  factory :project do
    user { FactoryBot.create(:user) }
    sequence(:description) { |i| "content et bio #{i}" }
    sequence(:name) { |i| "Titre#{i}" }
    place_name { 'Paris' }
    country { 'France' }
  end
end
