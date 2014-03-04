require "spec_helper"


describe Api::V1::QuestionsController do
  render_views

  let(:api_key)     { create(:api_key)  }
  let!(:question_1) { create(:question) }
  let!(:question_2) { create(:question) }
  
  before do
    request.env['HTTP_AUTHORIZATION'] = 
          ActionController::HttpAuthentication::Token.
          encode_credentials(api_key.access_token)
  end

  describe "fetching all questions" do  
    before do
      get :index, {format: :json}
    end

    it { expect(response).to be_success }
    it { expect(response.body).to include(question_1.title) }
    it { expect(response.body).to include(question_2.title) }
    it { expect(response.body).to include(question_1.body) }
    it { expect(response.body).to include(question_2.body) }
  end

  describe "fetching single question" do
    let(:question) { create(:question) }

    before do
      get :show, id: question.id, format: :json
    end

    it "includes question title" do
      body_json = JSON.parse(response.body)
      expect(body_json["title"]).to eq(question.title)
    end

  end

end