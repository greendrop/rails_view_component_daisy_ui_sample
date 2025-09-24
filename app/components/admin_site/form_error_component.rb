# frozen_string_literal: true

module AdminSite
  class FormErrorComponent < ViewComponent::Base
    def initialize(errors:, except_attributes: [])
      @errors = errors
      @except_attributes = except_attributes

      super()
    end

    private

    attr_reader :errors, :except_attributes

    def messages
      (errors.messages.keys - except_attributes).map do |key|
        errors.full_messages_for(key)
      end.flatten
    end
  end
end
