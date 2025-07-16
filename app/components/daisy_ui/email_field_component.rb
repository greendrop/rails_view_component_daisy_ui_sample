# frozen_string_literal: true

module DaisyUi
  class EmailFieldComponent < TextFieldComponent
    erb_template <<~ERB
      <%= email_field_tag(*args) %>
    ERB
  end
end
