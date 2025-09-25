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

        options = {
          for: "#{object_name}_#{method}",
          error_options: { show: false }
        }.deep_merge(options)

        error_options = options.delete(:error_options)
        errored = error_options[:show] && object.errors.include?(method)

        options[:override_classes] = [options[:class]] if options.key?(:class)

        label_component_class = errored ? AdminSite::ErrorLabelComponent : AdminSite::LabelComponent

        @template.render(label_component_class.new(**options)) do
          text || object.class.human_attribute_name(method)
        end
      end
    end
  end
end
