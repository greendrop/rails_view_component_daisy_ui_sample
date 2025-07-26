# frozen_string_literal: true

class CreateArticleCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :article_categories do |t|
      t.timestamps

      t.string :name
    end
  end
end
