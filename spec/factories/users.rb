FactoryBot.define do
  factory :user do
   username {"ZappaFranck"}
   sequence (:email) {|i| "makemefell#{i}@gmail.com"}
   sequence(:password) {|i| "makemefell#{i}"}
  end
end
