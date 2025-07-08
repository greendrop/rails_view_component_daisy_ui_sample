# frozen_string_literal: true

module ViewComponent
  module TestExtHelpers
    private

    def render_component_outside_view_context(*args, &block)
      @_render_component_outside_view_context_application_controller ||= ApplicationController.new
      @_render_component_outside_view_context_application_controller.view_context.render(*args, &block)
    end
  end
end
