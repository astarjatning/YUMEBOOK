class TopController < ApplicationController
  def top
    @index_list = ApplicationController.helpers.japanese_index
  end
end
