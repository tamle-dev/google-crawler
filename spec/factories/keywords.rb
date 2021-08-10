FactoryBot.define do
  factory :keyword do
    value { "MyString" }
    total_adword { 1 }
    total_url { 1 }
    total_result { 1 }
    total_result_time { 1 }
    keyword_attachment_id { 1 }
    result_attachment_id { 1 }
  end
end
