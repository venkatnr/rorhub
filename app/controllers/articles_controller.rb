class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
   require 'will_paginate/array' 
  def index
	if user_signed_in?
	 	@article = Article.find(:all, :conditions => {:user_id => current_user.id}).paginate(:page => params[:page], :per_page => 7)	
	else
		@articles = Article.find(:all).paginate(:page => params[:page], :per_page => 7)
	end
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
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  # POST /articles
  # POST /articles.json

  def create
	 @user = User.find(params[:user_id])
 
     @article = @user.articles.create!(params[:article])
	 
	 redirect_to root_path
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
     @user = User.find(params[:user_id])
 
     @article = @user.articles.update(params[:id])
	 
	 redirect_to root_path

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
