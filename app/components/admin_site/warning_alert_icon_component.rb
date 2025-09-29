# frozen_string_literal: true

module AdminSite
  class WarningAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleExclamationIconComponent.new)
    end
  end
end
