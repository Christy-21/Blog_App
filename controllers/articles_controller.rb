class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index]

  # GET /articles or /articles.json
  def index
    @articles = current_user.articles
  end

  # GET /articles/1 or /articles/1.json
  def show
    
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      
      # ArticleMailer.new_article_notification(current_user, @article).deliver_now
      ArticleNotificationWorker.perform_async(current_user.id, @article.id)
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end
  
  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    
    if @article.update(article_params)
    flash[:notice] = "Article was uploaded successfully."
    redirect_to @article
  else 
      render 'edit'
    end
  end 

  # DELETE /articles/1 or /articles/1.json
  def destroy
    
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
