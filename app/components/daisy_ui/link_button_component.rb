# frozen_string_literal: true

module DaisyUi
  class LinkButtonComponent < ViewComponent::Base # rubocop:disable Metrics/ClassLength
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

    def initialize( # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
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
      url: nil,
      controller: nil,
      action: nil,
      anchor: nil,
      only_path: nil,
      trailing_slash: nil,
      host: nil,
      protocol: nil,
      user: nil,
      password: nil,
      data: nil,
      method: nil,
      remote: nil,
      href: nil,
      hreflang: nil,
      type: nil,
      media: nil,
      rel: nil,
      rev: nil,
      charset: nil,
      shape: nil,
      coords: nil,
      target: nil,
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
      @url = url
      @controller = controller
      @action = action
      @anchor = anchor
      @only_path = only_path
      @trailing_slash = trailing_slash
      @host = host
      @protocol = protocol
      @user = user
      @password = password
      @data = data
      @method = method
      @remote = remote
      @href = href
      @hreflang = hreflang
      @type = type
      @media = media
      @rel = rel
      @rev = rev
      @charset = charset
      @shape = shape
      @coords = coords
      @target = target
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

      super()
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
                :url,
                :controller,
                :action,
                :anchor,
                :only_path,
                :trailing_slash,
                :host,
                :protocol,
                :user,
                :password,
                :data,
                :method,
                :remote,
                :href,
                :hreflang,
                :type,
                :media,
                :rel,
                :rev,
                :charset,
                :shape,
                :coords,
                :target,
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

      values = []
      values << url if url.present?
      values << options if options.present?
      values << html_options if html_options.present?

      @_args = values
    end

    def options
      {
        controller:,
        action:,
        anchor:,
        only_path:,
        trailing_slash:,
        host:,
        protocol:,
        user:,
        password:,
        data:,
        method:,
        remote:
      }.compact
    end

    def html_options
      {
        href:,
        hreflang:,
        type:,
        media:,
        rel:,
        rev:,
        charset:,
        shape:,
        coords:,
        target:,
        id:,
        class: link_class,
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

    def default_classes
      self.class::DEFAULT_CLASSES.dup
    end

    def link_class
      return @_link_class if @_link_class

      classes = default_classes
      classes = override_classes if override_classes
      classes << append_classes if append_classes
      classes.concat(size_classes) if size_classes.present?
      classes.concat(modifier_classes) if modifier_classes.present?
      classes.concat(behavior_classes) if behavior_classes.present?
      classes.join(' ')

      @_link_class = classes
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
