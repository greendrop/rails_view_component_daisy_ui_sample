# frozen_string_literal: true

module AdminSite
  class FormBuilder < ActionView::Helpers::FormBuilder
    include ActionView::Helpers::TagHelper
    include DatetimeField
    include ErrorMessage
    include Fieldset
    include Label
    include Select
    include Submit
    include TextField
    include Textarea
  end
end
