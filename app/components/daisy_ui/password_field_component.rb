# frozen_string_literal: true

module DaisyUi
  class PasswordFieldComponent < TextFieldComponent
    erb_template <<~ERB
      <%= password_field_tag(*args) %>
    ERB
  end
end
