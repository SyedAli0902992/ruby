class ArticlesController < ApplicationController
  def show
    find_article
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    find_article
  end

  def create
    @article = Article.new(articles_param)

    if @article.save
      flash[:notice] = "Article was saved successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    find_article
    if @article.update(articles_param)
      flash[:notice] = "Article was updates successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    find_article
    @article.destroy
    redirect_to article_path
  end

  private

  def articles_param
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end