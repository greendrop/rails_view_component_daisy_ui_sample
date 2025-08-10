# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.timestamps

      t.string :title
      t.text :body
      t.integer :status
      t.datetime :published_at
      t.references :article_category, null: false, foreign_key: true
    end
  end
end
