FactoryBot.define do
  factory :attendance do
    date { "2023-07-11" }
    in_time { "2023-07-11 16:01:59" }
    out_time { "2023-07-11 16:01:59" }
    employee { nil }
  end
end
