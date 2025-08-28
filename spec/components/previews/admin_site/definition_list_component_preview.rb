# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module AdminSite
  # @logical_path components/admin_site
  class DefinitionListComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::DefinitionListComponent

    include ViewComponent::TestExtHelpers

    layout 'admin_site/layouts/component_preview'

    # @label Default
    # @param override_classes text
    # @param append_classes text
    # @param id text
    def default(
      override_classes: nil,
      append_classes: nil,
      id: nil
    )
      render AdminSite::DefinitionListComponent.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        id:
      ) do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::DefinitionTermComponent.new.with_content('Term 1')
            ),
            render_component_outside_view_context(
              AdminSite::DefinitionDescriptionComponent.new.with_content('Description 1')
            ),
            render_component_outside_view_context(
              AdminSite::DefinitionTermComponent.new.with_content('Term 2')
            ),
            render_component_outside_view_context(
              AdminSite::DefinitionDescriptionComponent.new.with_content('Description 2')
            ),
            render_component_outside_view_context(
              AdminSite::DefinitionTermComponent.new.with_content('Term 3')
            ),
            render_component_outside_view_context(
              AdminSite::DefinitionDescriptionComponent.new.with_content('Description 3')
            )
          ]
        )
      end
    end
  end
end
