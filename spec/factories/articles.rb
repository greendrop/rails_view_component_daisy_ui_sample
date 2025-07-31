# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'MyString' }
    body { 'MyText' }
    status { 1 }
    published_at { '2025-07-30 20:05:24' }
    article_category { nil }
  end
end
