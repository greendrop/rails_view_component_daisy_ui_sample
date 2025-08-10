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
      data: nil,
      disabled: nil,
      tabindex: nil,
      accesskey: nil,
      id: nil,
      title: nil,
      style: nil,
      dir: nil,
      lang: nil,
      onclick: nil,
      ondblclick: nil,
      onmousedown: nil,
      onmouseup: nil,
      onmouseover: nil,
      onmousemove: nil,
      onmouseout: nil,
      onkeypress: nil,
      onkeydown: nil,
      onkeyup: nil
    )
      @override_classes = override_classes
      @append_classes = append_classes
      @tag_name = tag_name
      @data = data
      @disabled = disabled
      @tabindex = tabindex
      @accesskey = accesskey
      @id = id
      @title = title
      @style = style
      @dir = dir
      @lang = lang
      @onclick = onclick
      @ondblclick = ondblclick
      @onmousedown = onmousedown
      @onmouseup = onmouseup
      @onmouseover = onmouseover
      @onmousemove = onmousemove
      @onmouseout = onmouseout
      @onkeypress = onkeypress
      @onkeydown = onkeydown
      @onkeyup = onkeyup

      super()
    end

    private

    attr_reader :override_classes,
                :append_classes,
                :tag_name,
                :data,
                :disabled,
                :tabindex,
                :accesskey,
                :id,
                :title,
                :style,
                :dir,
                :lang,
                :onclick,
                :ondblclick,
                :onmousedown,
                :onmouseup,
                :onmouseover,
                :onmousemove,
                :onmouseout,
                :onkeypress,
                :onkeydown,
                :onkeyup

    def args
      return @_args if @_args

      values = {}
      values.merge!(options) if options.present?

      @_args = values
    end

    def options
      values = {
        data:,
        disabled:
      }.compact

      values.merge!(html_options) if html_options.present?
      values
    end

    def html_options
      {
        tabindex:,
        accesskey:,
        id:,
        class: label_class,
        title:,
        style:,
        dir:,
        lang:,
        onclick:,
        ondblclick:,
        onmousedown:,
        onmouseup:,
        onmouseover:,
        onmousemove:,
        onmouseout:,
        onkeypress:,
        onkeydown:,
        onkeyup:
      }.compact
    end

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def label_class
      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.join(' ')
    end
  end
end
