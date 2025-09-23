# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module Fieldset
      def fieldset(options: {}, &)
        @template.render(
          AdminSite::FieldsetComponent.new(
            **options
          )
        ) do
          yield if block_given?
        end
      end
    end
  end
end
