class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
     article = Article.find(params[:id])
  end 

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article.inspect imprime en el browser el objeto con sus valores
    @article.save
    redirect_to @article
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article #redirecciona al show del articulo con el id creado: localhost:3000/articles/9
    else
      render 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end

    # respond_to do |format|
    #   if @article.update(article_params)
    #     format.html { redirect_to @article, notice: 'Article was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @article }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /articles/1
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
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
