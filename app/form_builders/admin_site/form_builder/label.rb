# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module Label
      def label(method, text = nil, options = {})
        if text.is_a?(Hash)
          options = text.dup
          text = nil
        else
          options = options.dup
        end

        @template.render(
          AdminSite::LabelComponent.new(
            for: "#{object_name}_#{method}",
            **options
          )
        ) do
          text || object.class.human_attribute_name(method)
        end
      end
    end
  end
end
