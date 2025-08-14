# frozen_string_literal: true

module DaisyUi
  class AlertWarningIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleExclamationIconComponent.new)
    end
  end
end
