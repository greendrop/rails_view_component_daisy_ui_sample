# frozen_string_literal: true

module AdminSite
  class AlertBodyComponent < ViewComponent::Base
    erb_template <<~ERB
      <%= tag.div do %>
        <%= content %>
      <% end %>
    ERB
  end
end
