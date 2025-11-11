# frozen_string_literal: true

module UserSite
  class CardComponent < ViewComponent::Base
    DEFAULT_CLASSES = %w[card shadow-sm].freeze
    SIZE_EXTRA_SMALL = 'card-xs'
    SIZE_SMALL = 'card-sm'
    SIZE_MEDIUM = 'card-md'
    SIZE_LARGE = 'card-lg'
    SIZE_EXTRA_LARGE = 'card-xl'

    erb_template <<~ERB
      <%= tag.div(**args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      override_classes: nil,
      append_classes: nil,
      id: nil,
      size: nil,
      responsive_extra_small_size: nil,
      responsive_small_size: nil,
      responsive_medium_size: nil,
      responsive_large_size: nil,
      responsive_extra_large_size: nil
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id
      @size = size
      @responsive_extra_small_size = responsive_extra_small_size
      @responsive_small_size = responsive_small_size
      @responsive_medium_size = responsive_medium_size
      @responsive_large_size = responsive_large_size
      @responsive_extra_large_size = responsive_extra_large_size

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :id,
                :size,
                :responsive_extra_small_size,
                :responsive_small_size,
                :responsive_medium_size,
                :responsive_large_size,
                :responsive_extra_large_size

    def args
      return @_args if @_args

      values = {}
      values.merge!(options) if options.present?
      @_args = values
    end

    def options
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
  end
end
