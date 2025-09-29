# frozen_string_literal: true

module UserSite
  class InfoAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleInfoIconComponent.new)
    end
  end
end
