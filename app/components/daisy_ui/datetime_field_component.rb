# frozen_string_literal: true

module DaisyUi
  class DatetimeFieldComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['input'].freeze
    SIZE_EXTRA_SMALL = 'input-xs'
    SIZE_SMALL = 'input-sm'
    SIZE_MEDIUM = 'input-md'
    SIZE_LARGE = 'input-lg'
    SIZE_EXTRA_LARGE = 'input-xl'

    erb_template <<~ERB
      <%= datetime_field_tag(*args) %>
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
      **options
    )
      @name = name
      @value = value
      @override_classes = override_classes
      @append_classes = append_classes
      @size = size
      @responsive_extra_small_size = responsive_extra_small_size
      @responsive_small_size = responsive_small_size
      @responsive_medium_size = responsive_medium_size
      @responsive_large_size = responsive_large_size
      @responsive_extra_large_size = responsive_extra_large_size
      @disabled = disabled
      @options = options

      super()
    end

    private

    attr_reader :name,
                :value,
                :override_classes,
                :append_classes,
                :size,
                :responsive_extra_small_size,
                :responsive_small_size,
                :responsive_medium_size,
                :responsive_large_size,
                :responsive_extra_large_size,
                :disabled,
                :options

    def args
      return @_args if @_args

      @_args = [
        name,
        value,
        input_options.merge(options)
      ]
    end

    def input_options
      {
        disabled:,
        class: input_class
      }.compact
    end

    def input_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.concat(size_classes) if size_classes.present?
      classes.join(' ')
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def size_classes
      classes = []
      classes << size if size
      classes << "xs:#{SIZE_EXTRA_SMALL}" if responsive_extra_small_size
      classes << "sm:#{SIZE_SMALL}" if responsive_small_size
      classes << "md:#{SIZE_MEDIUM}" if responsive_medium_size
      classes << "lg:#{SIZE_LARGE}" if responsive_large_size
      classes << "xl:#{SIZE_EXTRA_LARGE}" if responsive_extra_large_size
      classes
    end
  end
end
