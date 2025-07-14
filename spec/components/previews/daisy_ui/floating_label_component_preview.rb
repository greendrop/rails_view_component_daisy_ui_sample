# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/floating_label
  class FloatingLabelComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::FloatingLabelComponent

    include ViewComponent::TestExtHelpers

    layout 'component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new do
        safe_join(
          [
            tag.span { 'Email' },
            render_component_outside_view_context(
              DaisyUi::TextFieldComponent.new(name: 'email', placeholder: 'user@example.com')
            )
          ]
        )
      end
    end
  end
end
