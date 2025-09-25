# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module AdminSite
  # @logical_path components/admin_site/fieldset
  class FieldsetComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::FieldsetComponent

    include ViewComponent::TestExtHelpers

    layout 'admin_site/layouts/component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new.with_content(
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::FieldsetLegendComponent.new.with_content('legend')
            ),
            render_component_outside_view_context(
              AdminSite::LabelComponent.new.with_content('label')
            ),
            render_component_outside_view_context(
              AdminSite::TextFieldComponent.new(name: 'input_name')
            ),
            render_component_outside_view_context(
              AdminSite::LabelComponent.new(tag_name: 'p').with_content('hint')
            )
          ]
        )
      )
    end
  end
end
