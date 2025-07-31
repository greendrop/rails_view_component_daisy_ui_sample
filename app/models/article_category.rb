# frozen_string_literal: true

# == Schema Information
#
# Table name: article_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArticleCategory < ApplicationRecord
end
