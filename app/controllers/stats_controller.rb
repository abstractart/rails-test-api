# Controller for showing service statistics
class StatsController < ApplicationController
  def index
    query_object = StatisticQuery.new(
      Message.in_time_range(params[:range])
    )

    @top_writers = query_object.top_writers
    @top_popular = query_object.top_popular
    @top_avg     = query_object.top_avg
  end
end
