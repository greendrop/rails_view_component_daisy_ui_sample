# frozen_string_literal: true

module AdminSite
  class ArticleCategoriesController < ApplicationController
    before_action :set_article_category, only: %i[show edit update destroy]

    def index
      @article_categories = ArticleCategory.all.page(page).per(per_page)
    end

    def show; end

    def new
      @article_category = ArticleCategory.new
    end

    def edit; end

    def create
      @article_category = ArticleCategory.new(article_category_params)

      if @article_category.save
        notice = t('admin_site.general.model_created_message', model: ArticleCategory.model_name.human)
        redirect_to admin_site_article_category_path(id: @article_category.id), notice:
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @article_category.update(article_category_params)
        notice = t('admin_site.general.model_updated_message', model: ArticleCategory.model_name.human)
        redirect_to admin_site_article_category_path(id: @article_category.id), notice:
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article_category.destroy!

      notice = t('admin_site.general.model_destroyed_message', model: ArticleCategory.model_name.human)
      redirect_to admin_site_article_categories_path, status: :see_other, notice:
    end

    private

    def set_article_category
      @article_category = ArticleCategory.find(params.expect(:id))
    end

    def article_category_params
      params.expect(article_category: %i[name])
    end
  end
end
