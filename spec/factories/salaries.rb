FactoryBot.define do
  factory :salary do
    yearly_package { 1 }
    monthly_income { 1 }
    net_income { 1 }
    employee { nil }
  end
end
