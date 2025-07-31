# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/new', type: :view do
  before do
    assign(:article, Article.new(
                       title: 'MyString',
                       body: 'MyText',
                       status: 1,
                       article_category: nil
                     ))
  end

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?]', articles_path, 'post' do
      assert_select 'input[name=?]', 'article[title]'

      assert_select 'textarea[name=?]', 'article[body]'

      assert_select 'input[name=?]', 'article[status]'

      assert_select 'input[name=?]', 'article[article_category_id]'
    end
  end
end
