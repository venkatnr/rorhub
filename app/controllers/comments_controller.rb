class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  require 'will_paginate/array' 
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @article = Article.find(params[:article_id])
    @comment = Comment.find(:all, :conditions => {:article_id => @article.id })
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
		@article = Article.find(params[:article_id])
        @comment = Comment.find(:all, :conditions => {:article_id => @article.id }).paginate(:page => params[:page], :per_page => 7)
       @article_user_email = User.find(:all,  :conditions => {:id=> @article.user_id}).first
      @email = @article_user_email.email
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
      
      @article = Article.find(params[:article_id])
      @article_user_email = User.find(:all,  :conditions => {:id=> @article.user_id}).first
      @email = @article_user_email.email
      
	if current_user.email == @email
		@comment = @article.comments.create!(params[:comment])
		@comment.update_attribute(:c_approval_status,1)
		 redirect_to  new_article_comment_path(@article.id )
	else
	@comment = @article.comments.create!(params[:comment])
	if @comment.save 
		@mymail = @email
		UserMailer.comment_approval(@mymail,@comment).deliver
	end
      redirect_to  new_article_comment_path(@article.id )
    end  
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

 def approve

 @comment = Comment.find(params[:cid])
 @articleid = Article.find(@comment.article_id)
 @approve = params[:approve]
 @comment.update_attributes(:c_approval_status => params[:approve])
 redirect_to  new_article_comment_path( @articleid )
 end


end
