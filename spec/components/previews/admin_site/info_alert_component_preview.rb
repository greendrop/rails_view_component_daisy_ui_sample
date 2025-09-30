# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site/info_alert
  class InfoAlertComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::InfoAlertComponent

    include ViewComponent::TestExtHelpers

    layout 'admin_site/layouts/component_preview'

    # @label Default
    # @param override_classes text
    # @param append_classes text
    def default(
      override_classes: nil,
      append_classes: nil
    )
      render COMPONENT_CLASS.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil
      ) do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::InfoAlertIconComponent.new
            ),
            render_component_outside_view_context(
              AdminSite::AlertBodyComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::AlertTextComponent.new.with_content('Message')
                )
              )
            )
          ]
        )
      end
    end

    # @label Action
    def action
      render COMPONENT_CLASS.new do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::InfoAlertIconComponent.new
            ),
            render_component_outside_view_context(
              AdminSite::AlertBodyComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::AlertTextComponent.new.with_content('Message')
                )
              )
            ),
            render_component_outside_view_context(
              AdminSite::AlertActionComponent.new.with_content(
                render_component_outside_view_context(
                  AdminSite::InfoButtonComponent.new(size: AdminSite::InfoButtonComponent::SIZE_SMALL).with_content('Action')
                )
              )
            )
          ]
        )
      end
    end

    # @label Title and Description
    def title_and_description
      render COMPONENT_CLASS.new do
        safe_join(
          [
            render_component_outside_view_context(
              AdminSite::InfoAlertIconComponent.new
            ),
            render_component_outside_view_context(
              AdminSite::AlertBodyComponent.new.with_content(
                safe_join(
                  [
                    render_component_outside_view_context(
                      AdminSite::AlertTitleComponent.new.with_content('Title')
                    ),
                    render_component_outside_view_context(
                      AdminSite::AlertDescriptionComponent.new.with_content('Description')
                    )
                  ]
                )
              )
            )
          ]
        )
      end
    end
  end
end
