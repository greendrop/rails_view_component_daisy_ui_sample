# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  before do
    assign(:articles, [
             Article.create!(
               title: 'Title',
               body: 'MyText',
               status: 2,
               article_category: nil
             ),
             Article.create!(
               title: 'Title',
               body: 'MyText',
               status: 2,
               article_category: nil
             )
           ])
  end

  it 'renders a list of articles' do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
