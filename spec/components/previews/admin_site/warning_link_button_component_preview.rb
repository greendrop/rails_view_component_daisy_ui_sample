# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site/link_button
  class WarningLinkButtonComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::WarningLinkButtonComponent
    SVG_ICON = '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="size-[1.2em]"><path stroke-linecap="round" stroke-linejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" /></svg>' # rubocop:disable Layout/LineLength

    layout 'admin_site/layouts/component_preview'

    # @label Default
    # @param content text
    # @param url text
    # @param override_classes text
    # @param append_classes text
    # @param id text
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
    def default(
      content: 'Content',
      url: '#',
      override_classes: nil,
      append_classes: nil,
      id: nil,
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
        id:,
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
    def behavior_active
      default(active: true, content: 'Active', url: '#')
    end

    # @label Disabled
    def behavior_disabled
      default(disabled: true, content: 'Disabled', url: '#')
    end

    # @!endgroup

    # @!group Sizes

    # @label Extra Small
    def size_extra_small
      default(size: COMPONENT_CLASS::SIZE_EXTRA_SMALL, content: 'Extra Small', url: '#')
    end

    # @label Small
    def size_small
      default(size: COMPONENT_CLASS::SIZE_SMALL, content: 'Small', url: '#')
    end

    # @label Medium
    def size_medium
      default(size: COMPONENT_CLASS::SIZE_MEDIUM, content: 'Medium', url: '#')
    end

    # @label Large
    def size_large
      default(size: COMPONENT_CLASS::SIZE_LARGE, content: 'Large', url: '#')
    end

    # @label Extra Large
    def size_extra_large
      default(size: COMPONENT_CLASS::SIZE_EXTRA_LARGE, content: 'Extra Large', url: '#')
    end

    # @!endgroup

    # @!group Modifiers

    # @label Wide
    def modifier_wide
      default(wide: true, content: 'Wide', url: '#')
    end

    # @label Block
    def modifier_block
      default(block: true, content: 'Block', url: '#')
    end

    # @label Square
    def modifier_square
      default(square: true, content: SVG_ICON.html_safe, url: '#') # rubocop:disable Rails/OutputSafety
    end

    # @label Circle
    def modifier_circle
      default(circle: true, content: SVG_ICON.html_safe, url: '#') # rubocop:disable Rails/OutputSafety
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
