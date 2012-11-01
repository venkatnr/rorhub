class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
   @user = User.find(params[:user_id])
   raise @user.inspect
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
   @user = User.find(params[:user_id])
   
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
   @user = User.find(params[:user_id])
   @userid = @user._id
    
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  




  def create
	 @user = User.find(params[:user_id])
 
     @article = @user.articles.create!(params[:article])
	 
	 redirect_to user_article_path( @user.id, @article.id )
   
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
