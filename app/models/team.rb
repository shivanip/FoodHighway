class Team < ActiveRecord::Base
  has_many :user_teams
  has_many :users, through: :user_teams

  def foods
    self.user_teams.map{|ut| ut.foods}.flatten
  end

  def current_weight
  	self.foods.map{|food| food.weight}.inject(:+)
  end
end