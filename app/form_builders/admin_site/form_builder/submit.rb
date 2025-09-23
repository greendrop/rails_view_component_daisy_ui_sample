# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module Submit
      FULL_WIDTH_CLASS = 'w-full'

      def submit(value = nil, options = {}, &)
        options = {
          type: 'submit',
          name: 'commit'
        }.deep_merge(options)

        @template.render(AdminSite::ButtonComponent.new(**options)) do
          value || submit_default_value
        end
      end

      def full_width_submit(value = nil, options = {}, &)
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end

        submit(value, options, &)
      end

      def primary_submit(value = nil, options = {}, &)
        options = {
          type: 'submit',
          name: 'commit'
        }.deep_merge(options)

        @template.render(AdminSite::PrimaryButtonComponent.new(**options)) do
          value || submit_default_value
        end
      end

      def full_width_primary_submit(value = nil, options = {}, &)
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end

        primary_submit(value, options, &)
      end
    end
  end
end
