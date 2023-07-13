FactoryBot.define do
  factory :leave do
    leave_type { 1 }
    from_date { "2023-07-12" }
    from_session { 1 }
    to_date { "2023-07-12" }
    to_session { 1 }
    mail_to { "MyString" }
    reason { "MyString" }
  end
end
