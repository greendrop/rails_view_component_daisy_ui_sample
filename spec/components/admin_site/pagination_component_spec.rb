# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::PaginationComponent, type: :component do
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
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('« First')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('‹ Prev')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#', active: true).with_content('1')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('2')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('3')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#', disabled: true).with_content('…')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('11')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('12')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('13')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('Next ›')
              ),
              render_component_outside_view_context(
                AdminSite::PaginationLinkButtonItemComponent.new(url: '#').with_content('Last »')
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'default') }

      it_behaves_like 'match snapshot'
    end
  end
end
