describe 'Pages' do
  describe 'GET /pages' do
    it 'show list of pages' do
      create_list(:page_with_links_and_headers, 10)
      get pages_path, xhr: true
      expect(response).to be_success
    end
  end
end
