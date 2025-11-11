# frozen_string_literal: true

require_relative '../../../support/view_component/test_ext_helpers'

module UserSite
  # @logical_path components/user_site/card
  class CardComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = UserSite::CardComponent

    include ViewComponent::TestExtHelpers

    layout 'user_site/layouts/component_preview'

    # @label Default
    # @param size select :size_options
    # @param responsive_extra_small_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_extra_large_size select :size_options
    def default(
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil
    )
      render UserSite::CardComponent.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:
      ) do
        render_component_outside_view_context(
          UserSite::CardBodyComponent.new.with_content(
            safe_join(
              [
                render_component_outside_view_context(
                  UserSite::CardTitleComponent.new.with_content(
                    'Card Title'
                  )
                ),
                tag.p do
                  'This is some example content inside the card body.'
                end,
                render_component_outside_view_context(
                  UserSite::CardActionsComponent.new.with_content(
                    safe_join(
                      [
                        render_component_outside_view_context(
                          UserSite::ButtonComponent.new.with_content('Action 1')
                        ),
                        render_component_outside_view_context(
                          UserSite::ButtonComponent.new.with_content('Action 2')
                        )
                      ]
                    )
                  )
                )
              ]
            )
          )
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
    def size_medium
      default(size: COMPONENT_CLASS::SIZE_MEDIUM)
    end

    # @label Large
    def size_large
      default(size: COMPONENT_CLASS::SIZE_LARGE)
    end

    # @label Extra Large
    def size_extra_large
      default(size: COMPONENT_CLASS::SIZE_EXTRA_LARGE)
    end

    # @!endgroup

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
