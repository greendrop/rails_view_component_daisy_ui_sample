# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FontAwesome::CircleInfoIconComponent, type: :component do
  describe 'snapshot' do
    let!(:snapshot_prefix) { described_class.name.underscore }
    let!(:rendered) { render_inline(instance) }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'default' do
      let!(:instance) { described_class.new }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end
  end
end
