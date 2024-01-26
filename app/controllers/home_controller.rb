class HomeController < ApplicationController
  PAGE_SIZE = 10

  def index
    @articles = Article.order('RANDOM()').limit(PAGE_SIZE)
  end
end
