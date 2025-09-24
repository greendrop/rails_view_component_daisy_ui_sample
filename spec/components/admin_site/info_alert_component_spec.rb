# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::InfoAlertComponent, type: :component do
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
                AdminSite::InfoAlertIconComponent.new
              ),
              render_component_outside_view_context(
                AdminSite::AlertBodyComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::AlertTextComponent.new.with_content('Message')
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
                AdminSite::InfoAlertIconComponent.new
              ),
              render_component_outside_view_context(
                AdminSite::AlertBodyComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::AlertTextComponent.new.with_content('Message')
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::AlertActionComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::InfoButtonComponent.new(size: AdminSite::InfoButtonComponent::SIZE_SMALL).with_content('Action')
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

    context 'title_and_description' do
      let!(:instance) do
        described_class.new.with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::InfoAlertIconComponent.new
              ),
              render_component_outside_view_context(
                AdminSite::AlertBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::AlertTitleComponent.new.with_content('Title')
                      ),
                      render_component_outside_view_context(
                        AdminSite::AlertDescriptionComponent.new.with_content('Description')
                      )
                    ]
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'title_and_description') }

      it_behaves_like 'match snapshot'
    end
  end
end
