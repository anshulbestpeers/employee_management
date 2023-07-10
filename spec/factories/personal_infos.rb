FactoryBot.define do
  factory :personal_info do
    father_name { "MyString" }
    mother_name { "MyString" }
    dob { "2023-07-10" }
    personal_contact { "MyString" }
    emergency_contact { "MyString" }
    blood_group { "MyString" }
    present_address { "MyString" }
    permanent_address { "MyString" }
    employee { nil }
  end
end
