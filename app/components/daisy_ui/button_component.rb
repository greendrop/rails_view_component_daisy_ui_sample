# frozen_string_literal: true

module DaisyUi
  class ButtonComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['btn'].freeze
    SIZE_EXTRA_SMALL = 'btn-xs'
    SIZE_SMALL = 'btn-sm'
    SIZE_MEDIUM = 'btn-md'
    SIZE_LARGE = 'btn-lg'
    SIZE_EXTRA_LARGE = 'btn-xl'

    erb_template <<~ERB
      <%= button_tag(**args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
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
      disabled: nil,
      **options
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @size = size
      @responsive_extra_small_size = responsive_extra_small_size
      @responsive_small_size = responsive_small_size
      @responsive_medium_size = responsive_medium_size
      @responsive_large_size = responsive_large_size
      @responsive_extra_large_size = responsive_extra_large_size
      @wide = wide
      @block = block
      @square = square
      @circle = circle
      @active = active
      @disabled = disabled
      @options = options

      super
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :size,
                :responsive_extra_small_size,
                :responsive_small_size,
                :responsive_medium_size,
                :responsive_large_size,
                :responsive_extra_large_size,
                :wide,
                :block,
                :square,
                :circle,
                :active,
                :disabled,
                :options

    def args
      return @_args if @_args

      values = button_options.stringify_keys.merge(options.stringify_keys)
      @_args = values
    end

    def button_options
      {
        disabled:,
        class: button_class
      }.compact
    end

    def button_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.concat(size_classes) if size_classes.present?
      classes.concat(modifier_classes) if modifier_classes.present?
      classes.concat(behavior_classes) if behavior_classes.present?
      classes.join(' ')
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def size_classes
      return @_size_classes if @_size_classes

      classes = []
      classes << size if size
      classes << "xs:#{SIZE_EXTRA_SMALL}" if responsive_extra_small_size
      classes << "sm:#{SIZE_SMALL}" if responsive_small_size
      classes << "md:#{SIZE_MEDIUM}" if responsive_medium_size
      classes << "lg:#{SIZE_LARGE}" if responsive_large_size
      classes << "xl:#{SIZE_EXTRA_LARGE}" if responsive_extra_large_size

      @_size_classes = classes
    end

    def modifier_classes
      return @_modifier_classes if @_modifier_classes

      classes = []
      classes << 'btn-wide' if wide
      classes << 'btn-block' if block
      classes << 'btn-square' if square
      classes << 'btn-circle' if circle

      @_modifier_classes = classes
    end

    def behavior_classes
      return @_behavior_classes if @_behavior_classes

      classes = []
      classes << 'btn-active' if active
      classes << 'btn-disabled' if disabled

      @_behavior_classes = classes
    end
  end
end
