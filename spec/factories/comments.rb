FactoryBot.define do
  factory :comment do
    user_id { User.last.id || association(:user) }
    project_id { Project.last.id || association(:project) }
  end
end
