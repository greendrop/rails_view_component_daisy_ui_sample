# frozen_string_literal: true

module DaisyUi
  class TextFieldComponent < ViewComponent::Base
    DEFAULT_CLASSES = ['input'].freeze
    SIZE_EXTRA_SMALL = 'input-xs'
    SIZE_SMALL = 'input-sm'
    SIZE_MEDIUM = 'input-md'
    SIZE_LARGE = 'input-lg'
    SIZE_EXTRA_LARGE = 'input-xl'

    erb_template <<~ERB
      <%= text_field_tag(*args) %>
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
      input_size: nil,
      maxlength: nil,
      placeholder: nil,
      accept: nil,
      readonly: nil,
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
      onkeyup: nil,
      onfocus: nil,
      onblur: nil,
      onselect: nil,
      onchange: nil
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
      @input_size = input_size
      @maxlength = maxlength
      @placeholder = placeholder
      @accept = accept
      @readonly = readonly
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
      @onfocus = onfocus
      @onblur = onblur
      @onselect = onselect
      @onchange = onchange

      super
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
                :input_size,
                :maxlength,
                :placeholder,
                :accept,
                :readonly,
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
                :onkeyup,
                :onfocus,
                :onblur,
                :onselect,
                :onchange

    def args
      return @_args if @_args

      values = [name, value, options]

      @_args = values
    end

    def options
      {
        disabled:,
        size: input_size,
        maxlength:,
        placeholder:,
        accept:,
        readonly:,
        tabindex:,
        accesskey:,
        id:,
        class: input_class,
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
        onkeyup:,
        onfocus:,
        onblur:,
        onselect:,
        onchange:
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
