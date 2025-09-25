# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module Textarea
      FULL_WIDTH_CLASS = 'w-full'

      def textarea(method, options = {})
        options = {
          name: "#{object_name}[#{method}]",
          value: object.public_send(method),
          error_options: { show: false }
        }.deep_merge(options)

        error_options = options.delete(:error_options)
        errored = error_options[:show] && object.errors.include?(method)

        options[:override_classes] = [options[:class]] if options.key?(:class)

        input_component_class = errored ? AdminSite::ErrorTextareaComponent : AdminSite::TextareaComponent
        input_content = @template.render(input_component_class.new(**options))

        return input_content unless errored

        input_content + error_message_on(method, error_options)
      end

      def full_width_textarea(method, options = {})
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end
        textarea(method, options)
      end

      def labeled_textarea(method, options = {})
        options = {
          label_options: {},
          error_options: { show: false }
        }.deep_merge(options)

        label_options = options.delete(:label_options)
        label_options[:error_options] = options[:error_options]

        label_content = label(method, nil, label_options)
        input_content = textarea(method, options)

        label_content + input_content
      end

      def labeled_full_width_textarea(method, options = {})
        options = {
          label_options: {},
          error_options: { show: false }
        }.deep_merge(options)

        label_options = options.delete(:label_options)
        label_options[:error_options] = options[:error_options]

        label_content = label(method, nil, label_options)
        input_content = full_width_textarea(method, options)

        label_content + input_content
      end
    end
  end
end
