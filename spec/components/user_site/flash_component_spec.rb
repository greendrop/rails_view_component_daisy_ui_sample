# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSite::FlashComponent, type: :component do
  describe 'snapshot' do
    let!(:snapshot_prefix) { described_class.name.underscore }
    let!(:rendered) { render_inline(instance) }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'flashにnoticeがある' do
      let!(:flash) do
        ActionDispatch::Flash::FlashHash.new.tap do |f|
          f[:notice] = 'This is a notice.'
        end
      end
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'notice') }

      it_behaves_like 'match snapshot'
    end

    context 'flashにalertがある' do
      let!(:flash) do
        ActionDispatch::Flash::FlashHash.new.tap do |f|
          f[:alert] = 'This is an alert.'
        end
      end
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'alert') }

      it_behaves_like 'match snapshot'
    end

    context 'flashにerrorがある' do
      let!(:flash) do
        ActionDispatch::Flash::FlashHash.new.tap do |f|
          f[:error] = 'This is an error.'
        end
      end
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'error') }

      it_behaves_like 'match snapshot'
    end

    context 'flashにdefaultがある' do
      let!(:flash) do
        ActionDispatch::Flash::FlashHash.new.tap do |f|
          f[:default] = 'This is a default message.'
        end
      end
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end

    context 'flashが複数ある' do
      let!(:flash) do
        ActionDispatch::Flash::FlashHash.new.tap do |f|
          f[:notice] = 'This is a notice.'
          f[:alert] = 'This is an alert.'
          f[:error] = 'This is an error.'
        end
      end
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'multiple') }

      it_behaves_like 'match snapshot'
    end

    context 'flashが空' do
      let!(:flash) { ActionDispatch::Flash::FlashHash.new }
      let!(:instance) { described_class.new(flash:) }
      let!(:snapshot_name) { File.join(snapshot_prefix, 'empty') }

      it_behaves_like 'match snapshot'
    end
  end
end
