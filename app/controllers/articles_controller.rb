class ArticlesController < ApplicationController
  # this action comes with devise
  before_action :authenticate_user!, except: [:index, :show]
  # before any other code executes this code will run for only the below methods. 
  before_action :set_article, only: [:show, :edit, :destroy, :update]

  def index
    @articles = Article.all
  end

  # find article by id and show on page
  def show
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      # flash.now will not persist and only shows one time. Without flash.now we would see the error message on both the new articles path and the index page. With flash.now it will only show on the page where the error occured.
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  def edit 
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:danger] = "Article has not been updated"
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    end
  end

  private
    # telling rails is ok to send the title and body of the article to be submitted.
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
