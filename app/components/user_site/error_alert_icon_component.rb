# frozen_string_literal: true

module UserSite
  class ErrorAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleXmarkIconComponent.new)
    end
  end
end
