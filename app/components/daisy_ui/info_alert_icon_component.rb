# frozen_string_literal: true

module DaisyUi
  class InfoAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleInfoIconComponent.new)
    end
  end
end
