# frozen_string_literal: true

module AdminSite
  class InfoAlertIconComponent < ViewComponent::Base
    def call
      render(FontAwesome::CircleInfoIconComponent.new)
    end
  end
end
