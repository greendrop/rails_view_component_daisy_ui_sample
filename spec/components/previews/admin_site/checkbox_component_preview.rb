# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site/checkbox
  class CheckboxComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::CheckboxComponent

    layout 'admin_site/layouts/component_preview'

    # @label Default
    # @param name text
    # @param value text
    # @param override_classes text
    # @param append_classes text
    # @param size select :size_options
    # @param responsive_extra_small_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_extra_large_size select :size_options
    # @param disabled toggle
    def default(
      name: 'enabled',
      value: '1',
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil,
      disabled: nil
    )
      render COMPONENT_CLASS.new(
        name:,
        value:,
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:,
        disabled:
      )
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

    # @label Disabled
    def behavior_disabled
      default(disabled: true)
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
