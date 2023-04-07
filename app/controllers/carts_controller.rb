class CartsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def index
    @carts = Cart.all

    render json: @carts
  end

  def create
    status = []
    params[:carts].each do |cart_params|
      cart = Cart.new
      cart_params[:items].each do |item_params|
        cart.items.build(article_id: item_params[:article_id], quantity: item_params[:quantity])
      end
      status << (cart.save ? cart : cart.errors)
    end

    render json: status
  end

  def show
    @cart = Cart.find(params[:id])

    render json: @cart
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update_column(name: params[:name], price: params[:price])

    render json: @cart
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    render json: "O produto #{@cart.name} foi excluido!"
  end

  private

  def permited_params(params)
    params.permit(items_attributes: [:article_id, :quantity])
  end
end
