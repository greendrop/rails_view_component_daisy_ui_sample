# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site/label
  class LabelComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::LabelComponent

    layout 'admin_site/layouts/component_preview'

    # @label Default
    # @param content text
    # @param tag_name text
    # @param override_classes text
    # @param append_classes text
    # @param id text
    def default(
      content: 'Label',
      tag_name: 'label',
      override_classes: nil,
      append_classes: nil,
      id: nil
    )
      render COMPONENT_CLASS.new(
        tag_name: tag_name || 'label',
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil,
        id:
      ).with_content(content || '')
    end
  end
end
