# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/error_alert
  class ErrorAlertComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::ErrorAlertComponent

    include ViewComponent::TestExtHelpers

    layout 'component_preview'

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
              DaisyUi::ErrorAlertIconComponent.new
            ),
            render_component_outside_view_context(
              DaisyUi::AlertBodyComponent.new.with_content(
                render_component_outside_view_context(
                  DaisyUi::AlertTextComponent.new.with_content('Message')
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
              DaisyUi::ErrorAlertIconComponent.new
            ),
            render_component_outside_view_context(
              DaisyUi::AlertBodyComponent.new.with_content(
                render_component_outside_view_context(
                  DaisyUi::AlertTextComponent.new.with_content('Message')
                )
              )
            ),
            render_component_outside_view_context(
              DaisyUi::AlertActionComponent.new.with_content(
                render_component_outside_view_context(
                  DaisyUi::ErrorButtonComponent.new(size: DaisyUi::ErrorButtonComponent::SIZE_SMALL).with_content('Action')
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
              DaisyUi::ErrorAlertIconComponent.new
            ),
            render_component_outside_view_context(
              DaisyUi::AlertBodyComponent.new.with_content(
                safe_join(
                  [
                    render_component_outside_view_context(
                      DaisyUi::AlertTitleComponent.new.with_content('Title')
                    ),
                    render_component_outside_view_context(
                      DaisyUi::AlertDescriptionComponent.new.with_content('Description')
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
