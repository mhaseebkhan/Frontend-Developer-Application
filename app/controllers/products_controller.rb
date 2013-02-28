class ProductsController < ApplicationController

  respond_to :json

  # GET /products
  def index
    respond_with(Product.all)
  end

  # GET /products/1
  def show
    respond_with(Product.find(params[:id]))
  end

  # POST /products
  def create
    @product = Product.new(params[:product])

    if @product.save
      respond_with(@product, status: :created)
    else
      respond_with(@product, status: :unprocessable_entity)
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(name: params[:product][:name], price: params[:product][:price], product_type: params[:product][:product_type])
      respond_with(nothing: true, status: :ok)
    else
      respond_with(@product, status: :unprocessable_entity)
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      respond_with(nothing: true, status: :ok)
    else
      respond_with(nothing: true, status: :forbidden)
    end
  end

end