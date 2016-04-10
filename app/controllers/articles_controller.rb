class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash[:danger] = "Article has not been created"
      render :new
    end
  end

  private
    # telling rails is ok to send the title and body of the article to be submitted.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
