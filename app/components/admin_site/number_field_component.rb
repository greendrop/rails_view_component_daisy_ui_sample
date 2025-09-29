# frozen_string_literal: true

module AdminSite
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
      disabled: nil,
      min: nil,
      max: nil,
      step: nil,
      maxlength: nil,
      placeholder: nil,
      **options
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
        maxlength:,
        placeholder:,
        **options
      )
    end

    private

    attr_reader :min,
                :max,
                :step

    def input_options
      super.merge({
        min:,
        max:,
        step:
      }.compact)
    end
  end
end
