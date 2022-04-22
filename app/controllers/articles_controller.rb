class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_page, only: [:show, :edit]

  def user_articles
    @articles = Article.where(user_id: current_user.id)
  end

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find_by(id: params[:id])
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @article = Article.find(params[:id])

    unless @article.user.id == current_user.id
      redirect_to @article, notice: "You can't edit this article"
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def correct_page
    @article = Article.find_by(id: params[:id])
    redirect_to root_path, notice: 'Page not found' if @article.nil?
  end
end
