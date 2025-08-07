# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:articles) }
  end

  describe 'validations' do
    describe 'name' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_length_of(:name).is_at_most(255) }
    end
  end
end
