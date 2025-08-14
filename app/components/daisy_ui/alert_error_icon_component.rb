# frozen_string_literal: true

module DaisyUi
  class AlertErrorIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleXmarkIconComponent.new)
    end
  end
end
