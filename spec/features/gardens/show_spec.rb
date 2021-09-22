require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @garden1 = Garden.create!(name: 'Turing Community Garden', organic: true)
    @garden2 = Garden.create!(name: 'Public Library Garden', organic: true)
    @garden3 = Garden.create!(name: 'Main Street Garden', organic: false)

    @plot1 = @garden1.plots.create!(number: 25, size: "Large", direction: "East")
    @plot2 = @garden1.plots.create!(number: 26, size: "Small", direction: "West")
    @plot3 = @garden2.plots.create!(number: 2, size: "Small", direction: "South")
    @plot4 = @garden3.plots.create!(number: 738, size: "Medium", direction: "West")

    @plant1 = Plant.create!(name: "pretty plant", description: "it's pretty", harvest: 45)
    @plant2 = Plant.create!(name: "ugly plant", description: "it's ugly but useful", harvest: 15)
    @plant3 = Plant.create!(name: "big plant", description: "it's big", harvest: 14)
    @plant4 = Plant.create!(name: "small plant", description: "it's small but effective", harvest: 200)
    @plant5 = Plant.create!(name: "other plant", description: "it's another plant", harvest: 125)

    PlantPlot.create!(plot: @plot1, plant: @plant1)
    PlantPlot.create!(plot: @plot1, plant: @plant2)
    PlantPlot.create!(plot: @plot2, plant: @plant3)
    PlantPlot.create!(plot: @plot2, plant: @plant4)
    PlantPlot.create!(plot: @plot3, plant: @plant4)
    PlantPlot.create!(plot: @plot3, plant: @plant2)
  end

  it 'shows a list of plants' do
    visit garden_path(@garden1)

    expect(page).to have_content(@plant1.name)
    expect(page).to have_content(@plant2.name)
  end
end
