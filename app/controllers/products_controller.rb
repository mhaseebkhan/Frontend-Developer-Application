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
    @product = Product.new(params[:frontend])

    if @product.save
      respond_with(@product, status: :created)
    else
      respond_with(@product.errors, status: :unprocessable_entity)
    end
  end

  # PUT /products/1
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:frontend])
      respond_width(nothing: true, status: :ok)
    else
      respond_width(@product.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /products/1
  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      respond_width(nothing: true, status: :ok)
    else
      respond_with(nothing: true, status: :forbidden)
    end
  end
end