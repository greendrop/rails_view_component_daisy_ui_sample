# frozen_string_literal: true

module AdminSite
  # @logical_path components/admin_site
  class FlashComponentPreview < Lookbook::Preview
    COMPONENT_CLASS = AdminSite::FlashComponent

    layout 'admin_site/layouts/component_preview'

    # @label Default
    def default
      render COMPONENT_CLASS.new(
        flash: ActionDispatch::Flash::FlashHash.new.tap { |f| f[:default] = 'This is a default message.' }
      )
    end

    # @label Info
    def info
      render COMPONENT_CLASS.new(
        flash: ActionDispatch::Flash::FlashHash.new.tap { |f| f[:notice] = 'This is an info message.' }
      )
    end

    # @label Error
    def error
      render COMPONENT_CLASS.new(
        flash: ActionDispatch::Flash::FlashHash.new.tap { |f| f[:error] = 'This is an error message.' }
      )
    end
  end
end
