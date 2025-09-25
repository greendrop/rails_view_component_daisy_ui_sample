# frozen_string_literal: true

module DaisyUi
  class LabelComponent < ViewComponent::Base
    DEFAULT_CLASSES = %w[label].freeze

    erb_template <<~ERB
      <%= tag.public_send(tag_name, **args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      tag_name: 'label',
      override_classes: nil,
      append_classes: nil,
      id: nil,
      **options
    )
      @tag_name = tag_name
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id
      @options = options

      super()
    end

    private

    attr_reader :tag_name,
                :override_classes,
                :append_classes,
                :id,
                :options

    def args
      return @_args if @_args

      @_args = component_options.merge(options)
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
      classes.join(' ')
    end
  end
end
