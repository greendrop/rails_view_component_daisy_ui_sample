# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DaisyUi::FieldsetComponent, type: :component do
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
                DaisyUi::FieldsetLegendComponent.new.with_content('legend')
              ),
              render_component_outside_view_context(
                DaisyUi::LabelComponent.new.with_content('label')
              ),
              render_component_outside_view_context(
                DaisyUi::TextFieldComponent.new(name: 'input_name')
              ),
              render_component_outside_view_context(
                DaisyUi::LabelComponent.new(tag_name: 'p').with_content('hint')
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
