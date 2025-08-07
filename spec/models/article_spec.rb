# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'enums' do
    it { is_expected.to define_enum_for(:status).with_values(draft: 0, published: 1) }
  end

  describe 'validations' do
    describe 'title' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_length_of(:title).is_at_most(255) }
    end

    describe 'body' do
      it { is_expected.to validate_presence_of(:body) }
    end

    describe 'published_at' do
      context 'statusがdraft' do
        subject { build(:article, status: :draft) }

        it { is_expected.not_to validate_presence_of(:published_at) }
      end

      context 'statusがpublished' do
        subject { build(:article, status: :published) }

        it { is_expected.to validate_presence_of(:published_at) }
      end
    end
  end
end
