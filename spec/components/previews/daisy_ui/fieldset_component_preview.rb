# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module DaisyUi
  # @logical_path components/daisy_ui/fieldset
  class FieldsetComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::FieldsetComponent

    include ViewComponent::TestExtHelpers

    layout 'component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new.with_content(
        safe_join(
          [
            render_component_outside_view_context(
              DaisyUi::FieldsetLegendComponent.new.with_content('legend')
            ),
            render_component_outside_view_context(
              DaisyUi::LabelComponent.new.with_content('label')
            ),
            render_component_outside_view_context(
              DaisyUi::TextFieldComponent.new(name: 'input_name')
            ),
            render_component_outside_view_context(
              DaisyUi::LabelComponent.new(tag_name: 'p').with_content('hint')
            )
          ]
        )
      )
    end
  end
end
