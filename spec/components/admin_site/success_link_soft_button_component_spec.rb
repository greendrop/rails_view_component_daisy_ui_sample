# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::SuccessLinkSoftButtonComponent, type: :component do
  describe 'snapshot' do
    let!(:snapshot_prefix) { described_class.name.underscore }
    let!(:rendered) { render_inline(instance) }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'default' do
      let!(:instance) { described_class.new(url: '#').with_content('Default') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end

    context 'activeがtrue' do
      let!(:instance) { described_class.new(url: '#', active: true).with_content('Active') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'active') }

      it_behaves_like 'match snapshot'
    end

    context 'disabledがtrue' do
      let!(:instance) { described_class.new(url: '#', disabled: true).with_content('Disabled') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'disabled') }

      it_behaves_like 'match snapshot'
    end

    context 'sizeを指定' do
      let!(:instance) do
        described_class.new(
          url: '#',
          size: described_class::SIZE_LARGE
        ).with_content('Large')
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'size_large') }

      it_behaves_like 'match snapshot'
    end

    context 'responsive_sizeを指定' do
      let!(:instance) do
        described_class.new(
          url: '#',
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

    context 'wideがtrue' do
      let!(:instance) { described_class.new(url: '#', active: true).with_content('Wide') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'wide') }

      it_behaves_like 'match snapshot'
    end

    context 'blockがtrue' do
      let!(:instance) { described_class.new(url: '#', active: true).with_content('Block') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'block') }

      it_behaves_like 'match snapshot'
    end

    context 'squareがtrue' do
      let!(:instance) { described_class.new(url: '#', square: true).with_content('S') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'square') }

      it_behaves_like 'match snapshot'
    end

    context 'circleがtrue' do
      let!(:instance) { described_class.new(url: '#', square: true).with_content('C') }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'circle') }

      it_behaves_like 'match snapshot'
    end
  end
end
