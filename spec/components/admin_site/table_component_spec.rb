# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminSite::TableComponent, type: :component do
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
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
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

    context 'sizeを指定' do
      let!(:instance) do
        described_class.new(
          size: described_class::SIZE_LARGE
        ).with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
                  )
                )
              )
            ]
          )
        )
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
        ).with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'responsive_sizes') }

      it_behaves_like 'match snapshot'
    end

    context 'zebraがtrue' do
      let!(:instance) do
        described_class.new(
          zebra: true
        ).with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'zebra') }

      it_behaves_like 'match snapshot'
    end

    context 'pin_rowsがtrue' do
      let!(:instance) do
        described_class.new(
          pin_rows: true
        ).with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'pin_rows') }

      it_behaves_like 'match snapshot'
    end

    context 'pin_colsがtrue' do
      let!(:instance) do
        described_class.new(
          pin_cols: true
        ).with_content(
          safe_join(
            [
              render_component_outside_view_context(
                AdminSite::TableCaptionComponent.new.with_content('caption')
              ),
              render_component_outside_view_context(
                AdminSite::TableHeaderComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableHeadComponent.new.with_content('header 3')
                          )
                        ]
                      )
                    )
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableBodyComponent.new.with_content(
                  safe_join(
                    [
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 1')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 2')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 3')
                              )
                            ]
                          )
                        )
                      ),
                      render_component_outside_view_context(
                        AdminSite::TableRowComponent.new.with_content(
                          safe_join(
                            [
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 4')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 5')
                              ),
                              render_component_outside_view_context(
                                AdminSite::TableCellComponent.new.with_content('cell 6')
                              )
                            ]
                          )
                        )
                      )
                    ]
                  )
                )
              ),
              render_component_outside_view_context(
                AdminSite::TableFooterComponent.new.with_content(
                  render_component_outside_view_context(
                    AdminSite::TableRowComponent.new.with_content(
                      safe_join(
                        [
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 1')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 2')
                          ),
                          render_component_outside_view_context(
                            AdminSite::TableCellComponent.new.with_content('footer 3')
                          )
                        ]
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      end
      let!(:snapshot_name) { File.join(snapshot_prefix, 'pin_cols') }

      it_behaves_like 'match snapshot'
    end
  end
end
