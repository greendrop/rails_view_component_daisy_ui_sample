# frozen_string_literal: true

module FontAwesome
  # @logical_path components/font_awesome
  class CircleCheckIconComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = FontAwesome::CircleCheckIconComponent

    layout 'component_preview'

    # @label Default
    # @param override_classes text
    # @param append_classes text
    def default(
      override_classes: nil,
      append_classes: nil
    )
      render COMPONENT_CLASS.new(
        override_classes: override_classes ? [override_classes] : nil,
        append_classes: append_classes ? [append_classes] : nil
      )
    end
  end
end
