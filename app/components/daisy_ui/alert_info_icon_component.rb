# frozen_string_literal: true

module DaisyUi
  class AlertInfoIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleInfoIconComponent.new)
    end
  end
end
