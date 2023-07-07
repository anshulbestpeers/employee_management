FactoryBot.define do
 factory :employee do
    name { 'John Doe' }
    email { 'john2@example.com' }
    password { 'password123' }
    dob { Date.today - 30.years }
    qualification { 'Bachelor of Science' }
    contact { '1234567890' }
    gender { 'Male' }
    association :department

    # trait :invalid do
    #   name { nil }
    # end
  end
end
