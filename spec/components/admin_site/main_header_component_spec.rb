# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::MainHeaderComponent, type: :component do
  describe 'snapshot' do
    include ActionView::Helpers::OutputSafetyHelper

    let!(:snapshot_prefix) { described_class.name.underscore }
    let!(:rendered) { render_inline(instance) }

    shared_examples 'match snapshot' do
      it { expect(rendered).to match_snapshot(snapshot_name) }
    end

    context 'default' do
      let!(:instance) do
        described_class.new.with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::MainHeaderTitleComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::MainHeaderTitleTextComponent.new.with_content('Title')
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end

    context 'action' do
      let!(:instance) do
        described_class.new.with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::MainHeaderTitleComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::MainHeaderTitleTextComponent.new.with_content('Title')
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::MainHeaderActionComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::LinkButtonComponent.new(url: '#').with_content('Action')
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'action') }

      it_behaves_like 'match snapshot'
    end
  end
end
