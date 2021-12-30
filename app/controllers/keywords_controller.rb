class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  def search
    @index_keywords = Keyword.search(params[:furigana])
  end
end
