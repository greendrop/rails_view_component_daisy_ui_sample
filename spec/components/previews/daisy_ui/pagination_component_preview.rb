# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui
  class PaginationComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::PaginationComponent

    include ViewComponent::TestExtHelpers

    layout 'daisy_ui/layouts/component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new do
        safe_join(
          [
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('« First')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('‹ Prev')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#', active: true).with_content('1')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('2')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('3')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('…')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('11')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('12')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('13')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('Next ›')
            ),
            render_component_outside_view_context(
              DaisyUi::PaginationLinkButtonItemComponent.new(url: '#').with_content('Last »')
            )
          ]
        )
      end
    end
  end
end
