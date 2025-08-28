# frozen_string_literal: true

module AdminSite
  class DefinitionTermComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['w-full', 'md:w-1/4', 'mb-2'].freeze

    erb_template <<~ERB
      <%= tag.dt(**args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      override_classes: nil,
      append_classes: nil,
      id: nil,
      **options
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id
      @options = options

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :id,
                :options

    def args
      return @_args if @_args

      @_args = definition_term_options.merge(options)
    end

    def definition_term_options
      {
        class: definition_term_class,
        id:
      }.compact
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def definition_term_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.join(' ')
    end
  end
end
