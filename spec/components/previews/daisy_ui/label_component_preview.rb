# frozen_string_literal: true

module DaisyUi
  # @logical_path components/daisy_ui/label
  class LabelComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = DaisyUi::LabelComponent

    layout 'daisy_ui/layouts/component_preview'

    # @label Default
    # @param content text
    # @param override_classes text
    # @param append_classes text
    # @param tag_name text
    # @param disabled toggle
    # @param id text
    # @param title text
    # @param style text
    # @param dir text
    # @param lang text
    # @param tabindex text
    # @param accesskey text
    # @param onclick text
    # @param ondblclick text
    # @param onmousedown text
    # @param onmouseup text
    # @param onmouseover text
    # @param onmousemove text
    # @param onmouseout text
    # @param onkeypress text
    # @param onkeydown text
    # @param onkeyup text
    def default(
      content: 'Label',
      tag_name: 'label',
      override_classes: nil,
      append_classes: nil,
      disabled: nil,
      id: nil,
      title: nil,
      style: nil,
      dir: nil,
      lang: nil,
      tabindex: nil,
      accesskey: nil,
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
      render COMPONENT_CLASS.new(
        tag_name: tag_name || 'label',
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        disabled:,
        id:,
        title:,
        style:,
        dir:,
        lang:,
        tabindex:,
        accesskey:,
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
      ).with_content(content || '')
    end
  end
end
