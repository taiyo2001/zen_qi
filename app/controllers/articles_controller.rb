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

  def edit
    @article = Article.find(params[:id])
    tag_names = @article.tags.map(&:name)
    @article.text_tags = tag_names.join(', ')
  end

  def update
    @article = Article.find(params[:id])
    status = params[:publish_button].present? ? 'active' : 'inactive'

    ActiveRecord::Base.transaction do
      if @article.update(article_create_params.merge(status:))
        redirect_to @article
      else
        render :new
      end
    end
  end

  private

  def article_create_params
    params.require(:article).permit(:title, :content, :text_tags).merge(user: current_user)
  end
end
