# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) do |n|
      Faker::Internet.email(
        name: "#{Faker::Internet.username(separators: %w[. - _])}+#{n}",
        domain: %w[sample.com email.com].sample,
      )
    end

    password do
      Faker::Alphanumeric.alpha(number: 1).downcase +
        Faker::Alphanumeric.alpha(number: 1).upcase +
        Faker::Number.number(digits: 1).to_s +
        Faker::Internet.password(
          min_length:         8,
          max_length:         29,
          special_characters: true
        )
    end
  end
end
