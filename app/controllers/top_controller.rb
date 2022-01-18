class TopController < ApplicationController
  def top
    @index_list = ApplicationController.helpers.japanese_index
    @diaries = current_user.diaries.all if logged_in?
  end
end
