# frozen_string_literal: true

module AdminSite
  class ApplicationController < ActionController::Base
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    # PER_PAGE = 20
    PER_PAGE = 3

    private_constant :PER_PAGE

    layout 'admin_site/layouts/application'

    private

    def page
      value = params[:page].to_i if params[:page].present?
      return value if value.present? && value.positive?

      nil
    end

    def per_page
      value = params[:per_page].to_i if params[:per_page].present?
      return value if value.present? && value.positive?

      PER_PAGE
    end
  end
end
