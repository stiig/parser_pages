describe PagesController do

  let(:valid_attributes) { attributes_for(:page) }

  let(:invalid_attributes) { { invalid: :data } }

  describe 'GET #index' do
    it 'assigns all pages as @pages' do
      page = create(:page)
      get :index

      expect(response.body).to eq([page].to_json)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested page as @page' do
      page = create(:page)
      get :show, params: { id: page.to_param }

      expect(response.body).to eq(page.to_json)
    end
  end


  describe 'POST #create' do
    context 'with valid params' do
      it 'create a new page' do
        post :create, params: { page: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq (Page.last.to_json)
      end

      it 'has Location to the created page' do
        post :create, params: { page: valid_attributes }

        expect(response.header['Location']).to eq page_url(Page.last)
      end
    end

    context 'with invalid params' do
      it 'must contain errors and unprocessable entity http status' do
        post :create, params: { page: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'must raise error when param page is missing' do
        expect {
          post :create, params: invalid_attributes
        }.to raise_error ActionController::ParameterMissing
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for(:page) }

      it 'updates the requested page' do
        page = create(:page)
        put :update, params: { id: page.id, page: new_attributes }
        page.reload

        expect(response).to be_success
        expect(JSON.parse(response.body)['url']).to eq new_attributes[:url]
      end

      it 'must return updated page' do
        page = create(:page)
        put :update, params: { id: page.id, page: valid_attributes }
        page.reload

        expect(response.body).to eq page.to_json
      end


      it 'has Location to the updated page' do
        page = create(:page)
        put :update, params: { id: page.id, page: valid_attributes }

        expect(response.header['Location']).to eq page_url(page)
      end
    end

    context 'with invalid params' do

      it 'must contain errors and unprocessable entity http status' do
        page = create(:page)
        put :update, params: { id: page.id, page: { url: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).not_to be_empty
      end

      it 'must raise error when param page is missing' do
        page = create(:page)
        expect {
          put :update, params: { id: page.id, bad_name: invalid_attributes }
        }.to raise_error ActionController::ParameterMissing
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested page' do
      page = create(:page)
      expect {
        delete :destroy, params: { id: page.to_param }
      }.to change(Page, :count).by(-1)
    end

    it 'return no_content' do
      page = create(:page)
      delete :destroy, params: { id: page.to_param }
      expect(response).to have_http_status(:no_content)
    end

    it 'raise record not found if id unknown' do
      expect { delete :destroy, params: { id: 'unknown' } }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
