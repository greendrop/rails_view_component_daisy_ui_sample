# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module DaisyUi
  # @logical_path components/daisy_ui/table
  class TableComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::TableComponent

    include ViewComponent::TestExtHelpers

    layout 'component_preview'

    # @label Default
    # @param size select :size_options
    # @param responsive_extra_small_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_extra_large_size select :size_options
    def default( # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil
    )
      render DaisyUi::TableComponent.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:
      ) do
        safe_join(
          [
            render_component_outside_view_context(
              DaisyUi::TableCaptionComponent.new.with_content('caption')
            ),
            render_component_outside_view_context(
              DaisyUi::TableHeaderComponent.new.with_content(
                safe_join(
                  [
                    render_component_outside_view_context(
                      DaisyUi::TableHeadComponent.new.with_content('header 1')
                    ),
                    render_component_outside_view_context(
                      DaisyUi::TableHeadComponent.new.with_content('header 2')
                    ),
                    render_component_outside_view_context(
                      DaisyUi::TableHeadComponent.new.with_content('header 3')
                    )
                  ]
                )
              )
            ),
            render_component_outside_view_context(
              DaisyUi::TableBodyComponent.new.with_content(
                safe_join(
                  [
                    render_component_outside_view_context(
                      DaisyUi::TableRowComponent.new.with_content(
                        safe_join(
                          [
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 1')
                            ),
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 2')
                            ),
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 3')
                            )
                          ]
                        )
                      )
                    ),
                    render_component_outside_view_context(
                      DaisyUi::TableRowComponent.new.with_content(
                        safe_join(
                          [
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 4')
                            ),
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 5')
                            ),
                            render_component_outside_view_context(
                              DaisyUi::TableCellComponent.new.with_content('cell 6')
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            ),
            render_component_outside_view_context(
              DaisyUi::TableFooterComponent.new.with_content(
                safe_join(
                  [
                    render_component_outside_view_context(
                      DaisyUi::TableCellComponent.new.with_content('footer 1')
                    ),
                    render_component_outside_view_context(
                      DaisyUi::TableCellComponent.new.with_content('footer 2')
                    ),
                    render_component_outside_view_context(
                      DaisyUi::TableCellComponent.new.with_content('footer 3')
                    )
                  ]
                )
              )
            )
          ]
        )
      end
    end

    # @!group Sizes

    # @label Extra Small
    def size_extra_small
      default(size: COMPONENT_CLASS::SIZE_EXTRA_SMALL)
    end

    # @label Small
    def size_small
      default(size: COMPONENT_CLASS::SIZE_SMALL)
    end

    # @label Medium
    def size_medium(content: 'Medium')
      default(size: COMPONENT_CLASS::SIZE_MEDIUM)
    end

    # @label Large
    def size_large(content: 'Large')
      default(size: COMPONENT_CLASS::SIZE_LARGE)
    end

    # @label Extra Large
    def size_extra_large(content: 'Extra Large')
      default(size: COMPONENT_CLASS::SIZE_EXTRA_LARGE)
    end

    private

    def size_options
      @_size_options ||= {
        choices: [
          COMPONENT_CLASS::SIZE_EXTRA_SMALL,
          COMPONENT_CLASS::SIZE_SMALL,
          COMPONENT_CLASS::SIZE_MEDIUM,
          COMPONENT_CLASS::SIZE_LARGE,
          COMPONENT_CLASS::SIZE_EXTRA_LARGE
        ],
        include_blank: true
      }
    end
  end
end
