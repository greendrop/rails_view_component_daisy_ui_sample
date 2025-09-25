# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module ErrorMessage
      def error_message_on(method, options = {})
        return unless object.errors.include?(method)

        options = {
          tag_name: 'div',
          append_classes: ['text-error']
        }.deep_merge(options)
        @template.render(
          AdminSite::LabelComponent.new(**options)
        ) do
          tag.ul(class: 'list-disc list-inside') do
            safe_join(
              object.errors.full_messages_for(method).map do |message|
                tag.li(message)
              end
            )
          end
        end
      end
    end
  end
end
