# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DaisyUi::InfoSoftButtonComponent, type: :component do
  describe 'snapshot' do
    let!(:snapshot_prefix) { described_class.name.underscore }
    let!(:rendered) { render_inline(instance) }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'default' do
      let!(:instance) { described_class.new.with_content('Default') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end

    context 'sizeを指定' do
      let!(:instance) do
        described_class.new(
          size: described_class::SIZE_LARGE
        ).with_content('Large')
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'size_large') }

      it_behaves_like 'match snapshot'
    end

    context 'responsive_sizeを指定' do
      let!(:instance) do
        described_class.new(
          size: described_class::SIZE_EXTRA_SMALL,
          responsive_extra_small_size: described_class::SIZE_EXTRA_SMALL,
          responsive_small_size: described_class::SIZE_SMALL,
          responsive_medium_size: described_class::SIZE_MEDIUM,
          responsive_large_size: described_class::SIZE_LARGE,
          responsive_extra_large_size: described_class::SIZE_EXTRA_LARGE
        ).with_content('Responsive Sizes')
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'responsive_sizes') }

      it_behaves_like 'match snapshot'
    end

    context 'disabledがtrue' do
      let!(:instance) do
        described_class.new(disabled: true).with_content('Disabled')
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'disabled') }

      it_behaves_like 'match snapshot'
    end
  end
end
