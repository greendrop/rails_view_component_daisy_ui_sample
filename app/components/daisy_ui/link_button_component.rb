# frozen_string_literal: true

module DaisyUi
  class LinkButtonComponent < ViewComponent::Base
    DEFAULT_CLASSES = %w[btn].freeze
    SIZE_EXTRA_SMALL = 'btn-xs'
    SIZE_SMALL = 'btn-sm'
    SIZE_MEDIUM = 'btn-md'
    SIZE_LARGE = 'btn-lg'
    SIZE_EXTRA_LARGE = 'btn-xl'

    erb_template <<~ERB
      <%= link_to(*args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      url:,
      override_classes: nil,
      append_classes: nil,
      size: nil,
      id: nil,
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
      @url = url
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id
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

      super()
    end

    private

    attr_reader :url,
                :override_classes,
                :append_classes,
                :id,
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

      values = [url]
      values << component_options if component_options.present?

      @_args = values
    end

    def component_options
      {
        class: component_class,
        id:
      }.compact
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def component_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.concat(size_classes) if size_classes.present?
      classes.concat(modifier_classes) if modifier_classes.present?
      classes.concat(behavior_classes) if behavior_classes.present?
      classes.join(' ')
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

    def modifier_classes
      classes = []
      classes << 'btn-wide' if wide
      classes << 'btn-block' if block
      classes << 'btn-square' if square
      classes << 'btn-circle' if circle
      classes
    end

    def behavior_classes
      classes = []
      classes << 'btn-active' if active
      classes << 'btn-disabled' if disabled
      classes
    end
  end
end
