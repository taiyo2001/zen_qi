class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    status = params[:publish_button].present? ? 'active' : 'inactive'
    @article = Article.new(article_create_params.merge(status:))

    ActiveRecord::Base.transaction do
      if @article.save
        redirect_to @article
      else
        render :new
      end
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_create_params
    params.require(:article).permit(:title, :content, :text_tags).merge(user: current_user)
  end
end
