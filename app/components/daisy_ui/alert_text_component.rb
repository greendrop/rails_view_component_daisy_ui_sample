# frozen_string_literal: true

module DaisyUi
  class AlertTextComponent < ViewComponent::Base
    erb_template <<~ERB
      <%= tag.div({class: 'test'}) do %>
        <%= content %>
      <% end %>
    ERB
  end
end
