class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @q = Keyword.ransack(params[:q])
    @searched_keywords = @q.result(distict: true)
  end
end
