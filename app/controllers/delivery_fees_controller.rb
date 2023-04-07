class DeliveryFeesController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def index
    @delivery = DeliveryFee.all

    render json: @delivery
  end

  def create
    status = []
    params[:delivery_fees].each do |delivery_params|
      delivery = DeliveryFee.new(price: delivery_params[:price])
      delivery.build_eligible_transaction_volume(min_price: delivery_params[:eligible_transaction_volume][:min_price], max_price: delivery_params[:eligible_transaction_volume][:max_price])
      status << (delivery.save ? delivery : delivery.errors)
    end

    render json: status
  end

  def show
    @delivery = DeliveryFee.find(params[:id])

    render json: @delivery
  end

  def update
    @delivery = DeliveryFee.find(params[:id])
    @delivery.update_column(price: params[:price])

    render json: @delivery
  end

  def destroy
    @delivery = DeliveryFee.find(params[:id])
    @delivery.destroy

    render json: "O frete #{@delivery.id} foi excluido!"
  end

  private

  def permited_params(params)
    params.permit(:price, eligible_transaction_volume_attributes: [:min_price, :max_price])
  end
end
