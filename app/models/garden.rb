class Garden < ApplicationRecord
  has_many :plots

  def garden_plants
    wip =plots.joins(:plants)
    # .where.not('plants.harvest >= ?', 100 )
    require "pry"; binding.pry
  end
end
