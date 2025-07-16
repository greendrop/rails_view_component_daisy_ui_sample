# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/email_field
  class NumberFieldComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::NumberFieldComponent

    layout 'component_preview'

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
    # @param min number
    # @param max number
    # @param step number
    # @param input_size text
    # @param maxlength number
    # @param placeholder text
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
    # @param onselect text
    # @param onchange text
    def default(
      name: 'field_name',
      value: nil,
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil,
      disabled: nil,
      min: nil,
      max: nil,
      step: nil,
      input_size: nil,
      maxlength: nil,
      placeholder: nil,
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
      onselect: nil,
      onchange: nil
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
        disabled:,
        min:,
        max:,
        step:,
        input_size:,
        maxlength:,
        placeholder:,
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
        onselect:,
        onchange:
      )
    end

    # @!group Sizes

    # @label Extra Small
    def size_extra_small(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        size: COMPONENT_CLASS::SIZE_EXTRA_SMALL
      )
    end

    # @label Small
    def size_small(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        size: COMPONENT_CLASS::SIZE_SMALL
      )
    end

    # @label Medium
    def size_medium(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        size: COMPONENT_CLASS::SIZE_MEDIUM
      )
    end

    # @label Large
    def size_large(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        size: COMPONENT_CLASS::SIZE_LARGE
      )
    end

    # @label Extra Large
    def size_extra_large(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        size: COMPONENT_CLASS::SIZE_EXTRA_LARGE
      )
    end

    # @!endgroup

    # @label Disabled
    def behavior_disabled(name: 'field_name', value: nil)
      render COMPONENT_CLASS.new(
        name:,
        value:,
        disabled: true
      )
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
