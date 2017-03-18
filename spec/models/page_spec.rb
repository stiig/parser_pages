# frozen_string_literal: true

describe Page do
  subject { create(:page) }

  it('can be created') { is_expected.to be }
  it('with links and headers can be created') { expect(create(:page_with_links_and_headers)).to be }
end
