# frozen_string_literal: true

module AdminSite
  class FieldsetLegendComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['fieldset'].freeze

    erb_template <<~ERB
      <%= tag.legend(**args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      override_classes: nil,
      append_classes: nil,
      id: nil,
      data: nil
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id
      @data = data

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :id,
                :data

    def args
      return @_args if @_args

      values = {}
      values.merge!(options) if options.present?
      @_args = values
    end

    def options
      {
        class: fieldset_class,
        id:,
        data:
      }.compact
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def fieldset_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.join(' ')
    end
  end
end
