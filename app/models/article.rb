# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id                  :bigint           not null, primary key
#  body                :text
#  published_at        :datetime
#  status              :integer
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  article_category_id :bigint           not null
#
# Indexes
#
#  index_articles_on_article_category_id  (article_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_category_id => article_categories.id)
#
class Article < ApplicationRecord
  belongs_to :article_category
end
