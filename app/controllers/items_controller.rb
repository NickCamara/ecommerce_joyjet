class ItemsController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all

    render json: @items
  end

  def create
    status = []
    params[:items].each do |item_params|
      item = Item.new(permited_params(item_params))
      status << (item.save ? item : item.errors)
    end

    render json: status
  end

  def show
    @item = Item.find(params[:id])

    render json: @item
  end

  def update
    @item = Item.find(params[:id])
    @item.update_column(article_id: params[:article_id], quantity: params[:quantity])

    render json: @item
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    render json: "Item de ID: #{@item.id} foi excluido!"
  end

  private

  def permited_params(params)
    params.permit(:article_id, :quantity)
  end
end