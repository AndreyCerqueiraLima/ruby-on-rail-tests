class Companies::ProductsController < ApplicationController
  respond_to :html, :json
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_company

  # GET /products or /products.json
  def index
    if params["search"].present?
      @products = Product.search{
        with(:name,params["search"])
        paginate page: params[:page], per_page: 2
      }.results
    else
      @products = Product.limit(10)
    end

  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = @company.products.create(product_params)
    respond_with @company,@product, location: company_path(@company)
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :company_id, :quantity)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end
end
