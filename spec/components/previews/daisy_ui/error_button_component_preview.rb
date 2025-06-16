# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/button
  class ErrorButtonComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::ErrorButtonComponent

    layout 'component_preview'

    # @param content text
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
      content: 'Content',
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
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:,
        disabled:
      ).with_content(content || '')
    end

    # @!group Sizes

    def size_extra_small(content: 'Extra Small')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_EXTRA_SMALL
      ).with_content(content)
    end

    def size_sm(content: 'Small')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_SMALL
      ).with_content(content)
    end

    def size_md(content: 'Medium')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_MEDIUM
      ).with_content(content)
    end

    def size_lg(content: 'Large')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_LARGE
      ).with_content(content)
    end

    def size_extra_large(content: 'Extra Large')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_EXTRA_LARGE
      ).with_content(content)
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
