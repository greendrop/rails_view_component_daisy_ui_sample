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

  enum :status, { draft: 0, published: 1 }

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true
  validates :published_at, presence: true, if: -> { published? }

  class << self
    def status_i18n(status)
      I18n.t("enums.#{model_name.i18n_key}.status.#{status}")
    end

    def status_options
      statuses.map { |key, _| [status_i18n(key), key] }
    end
  end

  def status_i18n
    self.class.status_i18n(status)
  end
end
