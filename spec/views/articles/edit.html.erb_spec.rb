# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  let(:article) do
    Article.create!(
      title: 'MyString',
      body: 'MyText',
      status: 1,
      article_category: nil
    )
  end

  before do
    assign(:article, article)
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(article), 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[body]'

      assert_select 'input[name=?]', 'article[status]'

      assert_select 'input[name=?]', 'article[article_category_id]'
    end
  end
end
