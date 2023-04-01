class ArticlesController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def index
    @articles = Article.all

    render json: @articles
  end

  def create
    status = []
    params[:articles].each do |article_params|
      article = Article.new(permited_params(article_params))
      status << (article.save ? article : article.errors)
    end
    
    render json: status
  end

  def show
    @article = Article.find(params[:id])

    render json: @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update_column(articles_params)

    render json: @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    render json: "O produto #{@article.name} foi excluido!"
  end

  private

  def permited_params(params)
    params.permit(:name, :price)
  end
end