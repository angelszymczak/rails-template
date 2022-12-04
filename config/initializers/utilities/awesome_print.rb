# frozen_string_literal: true

module Kernel
  def w(message)
    return unless Rails.env.development? || Rails.env.test?

    ap "*** #{Time.zone.now} ***", color: { string: :green }

    root_path = Rails.root
    src = caller.first.gsub("#{root_path}/", '')

    ap src, color: { string: :purpleish }
    message.respond_to?(:to_unsafe_h) ? ap(message.to_unsafe_h) : ap(message)

    ap '*** END ***', color: { string: :green }
  end
end
