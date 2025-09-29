# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site/floating_label
  class FloatingLabelComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::FloatingLabelComponent

    include ViewComponent::TestExtHelpers

    layout 'admin_site/layouts/component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new do
        safe_join(
          [
            tag.span { 'Email' },
            render_component_outside_view_context(
              AdminSite::TextFieldComponent.new(name: 'email', placeholder: 'user@example.com')
            )
          ]
        )
      end
    end
  end
end
