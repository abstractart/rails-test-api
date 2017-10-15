# Class for complex SQL queries
class StatisticQuery
  def initialize(relation = Message.all)
    @relation = relation
  end

  def top_writers
    columns = 'users.nickname, users.count_of_messages'

    relation.joins(:user).select(columns).limit(5)
  end

  def top_popular
    columns = 'users.id,users.nickname,messages.text,messages.count_of_votes'
    order_rule = 'messages.count_of_votes DESC'

    relation.joins(:user).select(columns).order(order_rule).limit(5)
  end

  def top_avg
    columns = 'users.id,users.nickname,AVG(messages.count_of_votes) as rating'
    group = 'users.id'
    order = 'rating DESC'

    relation.joins(:user).select(columns).group(group).order(order).limit(5)
  end

  private

  attr_reader :relation
end
