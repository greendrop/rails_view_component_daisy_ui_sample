# frozen_string_literal: true

module AdminSite
  class FormBuilder
    module Select
      include ActionView::Helpers::FormOptionsHelper

      FULL_WIDTH_CLASS = 'w-full'

      def select(method, choices = nil, options = {}, html_options = {}, &)
        option_tag =
          if choices.is_a?(Array) || choices.is_a?(Hash)
            options_for_select(choices, object.public_send(method))
          elsif choices.is_a?(String)
            choices
          end
        options = {
          name: "#{object_name}[#{method}]",
          option_tag:,
          error_options: { show: false }
        }.deep_merge(options).deep_merge(html_options)

        error_options = options.delete(:error_options)
        errored = error_options[:show] && object.errors.include?(method)

        options[:override_classes] = [options[:class]] if options.key?(:class)

        select_content = @template.render(AdminSite::SelectComponent.new(**options))

        return select_content unless errored

        select_content + error_message_on(method, error_options)
      end

      def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
        option_tags_options = {
          selected: options.fetch(:selected) { object.public_send(method) },
          disabled: options[:disabled]
        }
        choices = options_from_collection_for_select(collection, value_method, text_method, option_tags_options)

        select(method, choices, options, html_options)
      end

      def full_width_select(method, choices = nil, options = {}, html_options = {}, &)
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end
        select(method, choices, options, html_options, &)
      end

      def full_width_collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
        options = options.dup
        options[:append_classes] =
          if options[:append_classes].is_a?(String)
            options[:append_classes] += FULL_WIDTH_CLASS
          elsif options[:append_classes].is_a?(Array)
            options[:append_classes] << FULL_WIDTH_CLASS
          else
            [FULL_WIDTH_CLASS]
          end
        collection_select(method, collection, value_method, text_method, options, html_options)
      end

      def labeled_select(method, choices = nil, options = {}, html_options = {}, &)
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        select_content = select(method, choices, options, html_options, &)

        label_content + select_content
      end

      def labeled_collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        select_content = collection_select(method, collection, value_method, text_method, options, html_options)

        label_content + select_content
      end

      def labeled_full_width_select(method, choices = nil, options = {}, html_options = {}, &)
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        select_content = full_width_select(method, choices, options, html_options, &)

        label_content + select_content
      end

      def labeled_full_width_collection_select(method, collection, value_method, text_method, options = {},
                                               html_options = {})
        options = {
          label_options: {}
        }.deep_merge(options)

        label_options = options.delete(:label_options)

        label_content = label(method, nil, label_options)
        select_content = full_width_collection_select(method, collection, value_method, text_method, options,
                                                      html_options)

        label_content + select_content
      end
    end
  end
end
