# frozen_string_literal: true

module UserSite
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show]

    def index
      @articles = Article.published.page(page).per(per_page)
    end

    def show; end

    private

    def set_article
      @article = Article.find(params.expect(:id))
    end
  end
end
