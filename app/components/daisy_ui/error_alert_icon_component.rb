# frozen_string_literal: true

module DaisyUi
  class ErrorAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleXmarkIconComponent.new)
    end
  end
end
