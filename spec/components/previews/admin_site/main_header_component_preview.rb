# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module AdminSite
  # @logical_path components/admin_site
  class MainHeaderComponentPreview < Lookbook::Preview
    include ViewComponent::TestExtHelpers

    layout 'admin_site/layouts/component_preview'

    # @label Default
    def default(
      override_classes: nil,
      append_classes: nil
    )
      render MainHeaderComponent.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil
      ) do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::MainHeaderTitleComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::MainHeaderTitleTextComponent.new.with_content('Title')
                )
              )
            )
          ]
        )
      end
    end

    # @label Action
    def action
      render MainHeaderComponent.new do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::MainHeaderTitleComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::MainHeaderTitleTextComponent.new.with_content('Title')
                )
              )
            ),
            render_component_outside_view_context(
              AdminSite::MainHeaderActionComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::LinkButtonComponent.new(url: '#').with_content('Action')
                )
              )
            )
          ]
        )
      end
    end
  end
end
