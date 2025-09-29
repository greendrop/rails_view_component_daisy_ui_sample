# frozen_string_literal: true

module UserSite
  class AlertBodyComponent < ViewComponent::Base
    erb_template <<~ERB
      <%= tag.div do %>
        <%= content %>
      <% end %>
    ERB
  end
end
