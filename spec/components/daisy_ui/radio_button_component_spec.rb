# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DaisyUi::RadioButtonComponent, type: :component do

  describe 'snapshot' do
    let!(:snapshot_prefix) { described_class.name.underscore }
    let(:base_args) { { name: 'enabled' } }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'default' do
      let!(:instance) { described_class.new(**base_args) }
      let!(:rendered) { render_inline(instance) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end

    context 'disabledがtrue' do
      let!(:instance) { described_class.new(**base_args, disabled: true) }
      let!(:rendered) { render_inline(instance) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'disabled') }

      it_behaves_like 'match snapshot'
    end

    context 'sizeを指定' do
      let!(:instance) { described_class.new(**base_args, size: described_class::SIZE_LARGE) }
      let!(:rendered) { render_inline(instance) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'size_large') }

      it_behaves_like 'match snapshot'
    end

    context 'responsive_sizeを指定' do
      let!(:instance) do
        described_class.new(
          **base_args,
          size: described_class::SIZE_EXTRA_SMALL,
          responsive_extra_small_size: described_class::SIZE_EXTRA_SMALL,
          responsive_small_size: described_class::SIZE_SMALL,
          responsive_medium_size: described_class::SIZE_MEDIUM,
          responsive_large_size: described_class::SIZE_LARGE,
          responsive_extra_large_size: described_class::SIZE_EXTRA_LARGE
        )
      end
      let!(:rendered) { render_inline(instance) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'responsive_sizes') }

      it_behaves_like 'match snapshot'
    end
  end
end
