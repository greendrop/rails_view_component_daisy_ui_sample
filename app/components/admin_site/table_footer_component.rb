# frozen_string_literal: true

module AdminSite
  class TableFooterComponent < ViewComponent::Base
    DEFAULT_CLASSES = [].freeze

    erb_template <<~ERB
      <%= tag.tfoot(*args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      override_classes: nil,
      append_classes: nil,
      id: nil
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @id = id

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :id

    def args
      return @_args if @_args

      values = []
      values << options if options.present?
      @_args = values
    end

    def options
      {
        class: tbody_class,
        id:
      }.compact
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def tbody_class
      return @_thead_class if @_thead_class

      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.join(' ')

      @_thead_class = classes
    end
  end
end
