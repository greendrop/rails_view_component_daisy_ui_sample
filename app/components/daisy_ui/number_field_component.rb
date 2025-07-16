# frozen_string_literal: true

module DaisyUi
  class NumberFieldComponent < TextFieldComponent
    erb_template <<~ERB
      <%= number_field_tag(*args) %>
    ERB

    def initialize(
      name:,
      value: nil,
      override_classes: nil,
      append_classes: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil,
      min: nil,
      max: nil,
      step: nil,
      input_size: nil,
      maxlength: nil,
      placeholder: nil,
      accept: nil,
      readonly: nil,
      disabled: nil,
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
      @min = min
      @max = max
      @step = step

      super(
        name:,
        value:,
        override_classes:,
        append_classes:,
        size:,
        responsive_extra_small_size:,
        responsive_small_size:,
        responsive_medium_size:,
        responsive_large_size:,
        responsive_extra_large_size:,
        disabled:,
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
        onchange:,
      )
    end

    private

    attr_reader :min,
                :max,
                :step
  end
end
