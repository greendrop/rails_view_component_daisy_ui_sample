# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/select
  class SelectComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::SelectComponent

    include ActionView::Helpers::FormOptionsHelper

    layout 'component_preview'

    # @label Default
    # @param name text
    # @param override_classes text
    # @param append_classes text
    # @param size select :size_options
    # @param responsive_extra_small_size select :size_options
    # @param responsive_small_size select :size_options
    # @param responsive_medium_size select :size_options
    # @param responsive_large_size select :size_options
    # @param responsive_extra_large_size select :size_options
    # @param multiple toggle
    # @param disabled toggle
    # @param include_blank toggle
    # @param prompt text
    # @param accept text
    # @param readonly toggle
    # @param tabindex text
    # @param accesskey text
    # @param id text
    # @param title text
    # @param style text
    # @param dir text
    # @param lang text
    # @param onclick text
    # @param ondblclick text
    # @param onmousedown text
    # @param onmouseup text
    # @param onmouseover text
    # @param onmousemove text
    # @param onmouseout text
    # @param onkeypress text
    # @param onkeydown text
    # @param onkeyup text
    # @param onfocus text
    # @param onblur text
    # @param onchange text
    def default(
      name: 'color',
      option_tag: options_for_select([%w[Red red], %w[Green green], %w[Blue blue]]),
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil,
      multiple: nil,
      disabled: nil,
      include_blank: nil,
      prompt: nil,
      accept: nil,
      readonly: nil,
      tabindex: nil,
      accesskey: nil,
      id: nil,
      title: nil,
      style: nil,
      dir: nil,
      lang: nil,
      onclick: nil,
      ondblclick: nil,
      onmousedown: nil,
      onmouseup: nil,
      onmouseover: nil,
      onmousemove: nil,
      onmouseout: nil,
      onkeypress: nil,
      onkeydown: nil,
      onkeyup: nil,
      onfocus: nil,
      onblur: nil,
      onchange: nil
    )
      render COMPONENT_CLASS.new(
        name:,
        option_tag:,
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:,
        multiple:,
        disabled:,
        include_blank:,
        prompt:,
        accept:,
        readonly:,
        tabindex:,
        accesskey:,
        id:,
        title:,
        style:,
        dir:,
        lang:,
        onclick:,
        ondblclick:,
        onmousedown:,
        onmouseup:,
        onmouseover:,
        onmousemove:,
        onmouseout:,
        onkeypress:,
        onkeydown:,
        onkeyup:,
        onfocus:,
        onblur:,
        onchange:
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
