# frozen_string_literal: true

module DaisyUi
  class AlertActionComponent < ViewComponent::Base
    erb_template <<~ERB
      <%= tag.div do %>
        <%= content %>
      <% end %>
    ERB
  end
end
