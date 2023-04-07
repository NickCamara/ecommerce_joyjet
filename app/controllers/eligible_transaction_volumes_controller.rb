class EligibleTransactionVolumesController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def index
    @transaction = EligibleTransactionVolume.all

    render json: @transaction
  end

  def create
    status = []
    params[:eligible_transaction_volume].each do |transaction_params|
      transaction = EligibleTransactionVolume.new(permited_params(transaction_params))
      status << (transaction.save ? transaction : transaction.errors)
    end
    
    render json: status
  end

  def show
    @transaction = EligibleTransactionVolume.find(params[:id])

    render json: @transaction
  end

  def update
    @transaction = EligibleTransactionVolume.find(params[:id])
    @transaction.update_column(transaction_params)

    render json: @transaction
  end

  def destroy
    @transaction = EligibleTransactionVolume.find(params[:id])
    @transaction.destroy

    render json: "O limite #{@transaction.id} foi excluido!"
  end

  private

  def permited_params(params)
    params.permit(:min_price, :max_price)
  end
end