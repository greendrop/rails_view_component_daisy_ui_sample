# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/link_outline_button
  class WarningLinkOutlineButtonComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::WarningLinkOutlineButtonComponent
    SVG_ICON = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="size-[1.2em]"><path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" /></svg>' # rubocop:disable Layout/LineLength

    layout 'daisy_ui/layouts/component_preview'

    # @label Default
    # @param content text
    # @param override_classes text
    # @param append_classes text
    # @param size select :size_options
    # @param responsive_extra_small_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_extra_large_size select :size_options
    # @param wide toggle
    # @param block toggle
    # @param square toggle
    # @param circle toggle
    # @param active toggle
    # @param disabled toggle
    # @param url text
    def default(
      content: 'Content',
      url: '#',
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil,
      wide: false,
      block: false,
      square: false,
      circle: false,
      active: nil,
      disabled: nil
    )
      render COMPONENT_CLASS.new(
        url:,
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:,
        wide:,
        block:,
        square:,
        circle:,
        active:,
        disabled:
      ).with_content(content || '')
    end

    # @!group Behaviors

    # @label Active
    def behavior_active(content: 'Active', url: '#')
      render COMPONENT_CLASS.new(
        active: true,
        url:
      ).with_content(content)
    end

    # @label Disabled
    def behavior_disabled(content: 'Disabled', url: '#')
      render COMPONENT_CLASS.new(
        disabled: true,
        url:
      ).with_content(content)
    end

    # @!endgroup

    # @!group Sizes

    # @label Extra Small
    def size_extra_small(content: 'Extra Small', url: '#')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_EXTRA_SMALL,
        url:
      ).with_content(content)
    end

    # @label Small
    def size_small(content: 'Small', url: '#')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_SMALL,
        url:
      ).with_content(content)
    end

    # @label Medium
    def size_medium(content: 'Medium', url: '#')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_MEDIUM,
        url:
      ).with_content(content)
    end

    # @label Large
    def size_large(content: 'Large', url: '#')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_LARGE,
        url:
      ).with_content(content)
    end

    # @label Extra Large
    def size_extra_large(content: 'Extra Large', url: '#')
      render COMPONENT_CLASS.new(
        size: COMPONENT_CLASS::SIZE_EXTRA_LARGE,
        url:
      ).with_content(content)
    end

    # @!endgroup

    # @!group Modifiers

    # @label Wide
    def modifier_wide(content: 'Wide', url: '#')
      render COMPONENT_CLASS.new(
        wide: true,
        url:
      ).with_content(content)
    end

    # @label Block
    def modifier_block(content: 'Block', url: '#')
      render COMPONENT_CLASS.new(
        block: true,
        url:
      ).with_content(content)
    end

    # @label Square
    def modifier_square(
      content: SVG_ICON.html_safe, # rubocop:disable Rails/OutputSafety
      url: '#'
    )
      render COMPONENT_CLASS.new(
        square: true,
        url:
      ).with_content(content)
    end

    # @label Circle
    def modifier_circle(
      content: SVG_ICON.html_safe, # rubocop:disable Rails/OutputSafety
      url: '#'
    )
      render COMPONENT_CLASS.new(
        circle: true,
        url:
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
