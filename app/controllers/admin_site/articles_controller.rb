# frozen_string_literal: true

module AdminSite
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show edit update destroy]

    def index
      @articles = Article.all.page(page).per(per_page)
    end

    def show; end

    def new
      @article = Article.new
    end

    def edit; end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article.destroy!

      redirect_to articles_path, status: :see_other, notice: 'Article was successfully destroyed.'
    end

    private

    def set_article
      @article = Article.find(params.expect(:id))
    end

    def article_params
      params.expect(article: %i[title body status published_at article_category_id])
    end
  end
end
