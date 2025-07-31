# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before do
    assign(:article, Article.create!(
                       title: 'Title',
                       body: 'MyText',
                       status: 2,
                       article_category: nil
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
