# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/button
  class ErrorButtonComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::ErrorButtonComponent

    # @param content text
    # @param override_classes text
    # @param append_classes text
    # @param size select :size_options
    # @param responsive_xsmall_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_xlarge_size select :size_options
    # @param disabled toggle
    def default(
      content: 'Content',
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_xsmall_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_xlarge_size: nil,
      disabled: nil
    )
      render COMPONENT_CLASS.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_xsmall_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_xlarge_size:,
        disabled:
      ).with_content(content || '')
    end

    # @!group Sizes

    def size_xs(content: 'Extra Small')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_XSMALL
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

    def size_xl(content: 'Extra Large')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_XLARGE
      ).with_content(content)
    end

    # @!endgroup

    private

    def size_options
      @_size_options ||= {
        choices: [
          COMPONENT_CLASS::SIZE_XSMALL,
          COMPONENT_CLASS::SIZE_SMALL,
          COMPONENT_CLASS::SIZE_MEDIUM,
          COMPONENT_CLASS::SIZE_LARGE,
          COMPONENT_CLASS::SIZE_XLARGE
        ],
        include_blank: true
      }
    end
  end
end
