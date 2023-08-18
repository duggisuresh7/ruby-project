class SearchController < ApplicationController
  def index
      @query=Player.ransack(params[:q])
      @players=@query.result(distinct: false)

      @search_not_found = @query.result.empty?
  end
end
