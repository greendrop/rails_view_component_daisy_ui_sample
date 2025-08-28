# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::DefinitionListComponent, type: :component do
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
                AdminSite::DefinitionTermComponent.new.with_content('Term 1')
              ),
              render_component_outside_view_context(
                AdminSite::DefinitionDescriptionComponent.new.with_content('Description 1')
              ),
              render_component_outside_view_context(
                AdminSite::DefinitionTermComponent.new.with_content('Term 2')
              ),
              render_component_outside_view_context(
                AdminSite::DefinitionDescriptionComponent.new.with_content('Description 2')
              ),
              render_component_outside_view_context(
                AdminSite::DefinitionTermComponent.new.with_content('Term 3')
              ),
              render_component_outside_view_context(
                AdminSite::DefinitionDescriptionComponent.new.with_content('Description 3')
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
