# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_secure_password

  def self.authenticate(user, password)
    user.authenticate(password).tap do |auth|
      user.errors.add(:auth, I18n.t('errors.messages.format')) unless auth
    end
  end

  # Allow lower/uppercase Latin letters A-Za-z.
  # Allow digits 0-9.
  # Allow underscore, middle hyphen, plus, and dots.
  LOCAL_SECTION = 'A-Za-z0-9+_.-'
  DOMAIN_SECTION = 'mail|email|sample'
  TLD_SECTION = 'com|org|net'

  EMAIL_PATTERN = /[#{LOCAL_SECTION}]+@(#{DOMAIN_SECTION})\.(#{TLD_SECTION})/

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: EMAIL_PATTERN, message: I18n.t('errors.messages.format') }

  validates :password,
    presence: true,
    length: { in: 8..32 }
  validate :validate_password_format, if: -> { password.present? && password_digest_changed? }

  private

  PASSWORD_RULES = {
    at_least_one_lowercase_letter: /[a-z]+/,
    at_least_one_uppercase_letter: /[A-Z]+/,
    at_least_one_digit: /\d+/,
    at_least_one_special_character: /[^A-Za-z0-9\s]+/,
  }.freeze

  def validate_password_format
    PASSWORD_RULES.each do |rule, regex|
      next if password.match?(regex)

      errors.add(:password, rule)
    end

    validate_password_white_space
  end

  def validate_password_white_space
    return unless password.match?(/\s/)

    errors.add(:password, :avoid_white_space)
  end
end
