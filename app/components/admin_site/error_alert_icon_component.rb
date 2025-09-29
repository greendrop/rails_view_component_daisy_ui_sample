# frozen_string_literal: true

module AdminSite
  class ErrorAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleXmarkIconComponent.new)
    end
  end
end
