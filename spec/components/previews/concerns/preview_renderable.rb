# frozen_string_literal: true

module PreviewRenderable
  extend ActiveSupport::Concern

  private

  def render_nested_component(*args, &block)
    @_application_controller ||= ApplicationController.new
    @_application_controller.view_context.render(*args, &block)
  end
end
