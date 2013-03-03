require 'spec_helper'

describe ProductsController do

  let(:params) { { format: :json } }

  describe "GET #index" do
    it "returns an array of products" do
      (1..4).each do
        FactoryGirl.create(:product)
      end

      get :index, params

      json_response = JSON.parse(response.body)
      json_response.length.should be_equal 4
    end
  end

  describe "GET #show" do

    it "returns the product asked for" do

      product = FactoryGirl.create(:product)
      params[:id] = 1

      (1..4).each do
        FactoryGirl.create(:product)
      end

      get :show, params

      json_response = JSON.parse(response.body)
      json_response['name'].should eq product.name
    end

    it "throws and exception if the product id doesn't exist" do

      FactoryGirl.create(:product)
      params[:id] = 2

      expect{get :show, params}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "POST #create" do

    it "creates a new product with valid input" do
      expect {post :create, product: FactoryGirl.attributes_for(:product)}.to change(Product, :count).by(1)
    end

    describe "invalid input" do

      before(:each) do
        @product = FactoryGirl.create(:product)
        @product.id = ""
        @product.created_at = ""
        @product.updated_at = ""
      end

      it "doesn't create a new product when name is empty" do

        @product.name = ""
        params[:product] = @product.instance_values['attributes']
        post :create, params

        json_response = JSON.parse(response.body)
        json_response['errors']['name'].should_not be_nil
      end

      it "doesn't create a new product when type is empty" do

        @product.product_type = ""
        params[:product] = @product.instance_values['attributes']
        post :create, params

        json_response = JSON.parse(response.body)
        json_response['errors']['product_type'].should_not be_nil
      end

      it "doesn't create a new product when price is empty" do

        @product.price = ""
        params[:product] = @product.instance_values['attributes']
        post :create, params

        json_response = JSON.parse(response.body)
        json_response['errors']['price'].should_not be_nil
      end

      it "doesn't create a new product when price is not a number" do

        @product.price = "jkshdk"
        params[:product] = @product.instance_values['attributes']
        post :create, params

        json_response = JSON.parse(response.body)
        json_response['errors']['price'].should_not be_nil
      end
    end

  end

end
