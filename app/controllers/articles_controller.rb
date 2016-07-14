class ArticlesController < ApplicationController

  before_action :set_article,           only: [:edit, :update, :destroy]
  before_action :set_article_redirect,  only: [:show]
  before_action :authenticate_admin!, except: [:index, :show]

  include HighVoltage::StaticPage
  layout 'articles_layout'

  def index
    @articles = Article.all
  end

  def show
    render layout: 'show_article_layout'
  end

  def new
    @article = current_admin.articles.build
  end

  def edit
  end

  def create
    @article = current_admin.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:headline, :slug, :intro, :body, :admin_id)
    end

    def set_article_redirect
      @article = Article.friendly.find(params[:id])
      # If an old id or a numeric id was used to find the record, then
      # the request path will not match the article_path, and we should do
      # a 301 redirect that uses the current friendly id.
      if request.path != article_path(@article)
        redirect_to @article, status: :moved_permanently
      end
    end

end
