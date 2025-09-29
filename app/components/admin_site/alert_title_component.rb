# frozen_string_literal: true

module AdminSite
  class AlertTitleComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['font-bold'].freeze

    erb_template <<~ERB
      <%= tag.div(**args) do %>
        <%= content %>
      <% end %>
    ERB

    def initialize(
      override_classes: nil,
      append_classes: nil,
      **options
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @options = options

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :options

    def args
      return @_args if @_args

      @_args = alert_title_options.merge(options)
    end

    def alert_title_options
      {
        class: alert_title_class
      }.compact
    end

    def alert_title_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.join(' ')
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end
  end
end
