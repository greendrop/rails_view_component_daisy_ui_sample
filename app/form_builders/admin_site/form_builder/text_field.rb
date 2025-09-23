# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module TextField
      FULL_WIDTH_CLASS = 'w-full'

      def text_field(method, options = {})
        options = {
          name: "#{object_name}[#{method}]",
          value: object.public_send(method),
          error_options: { show: false }
        }.deep_merge(options)

        error_options = options.delete(:error_options)
        errored = error_options[:show] && object.errors.include?(method)

        options[:override_classes] = [options[:class]] if options.key?(:class)

        input_content = @template.render(AdminSite::TextFieldComponent.new(**options))

        return input_content unless errored

        input_content + error_message_on(method, error_options)
      end

      def full_width_text_field(method, options = {})
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end
        text_field(method, options)
      end

      def labeled_text_field(method, options = {})
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        input_content = text_field(method, options)

        label_content + input_content
      end

      def labeled_full_width_text_field(method, options = {})
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        input_content = full_width_text_field(method, options)

        label_content + input_content
      end
    end
  end
end
