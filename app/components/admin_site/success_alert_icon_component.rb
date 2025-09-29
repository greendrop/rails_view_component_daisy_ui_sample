# frozen_string_literal: true

module AdminSite
  class SuccessAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleCheckIconComponent.new)
    end
  end
end
