require "rails_helper"

RSpec.describe "Recipes Show Page" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id'" do
      it "displays the recipe's name, complexity, and genre, and I see a list of the names of the ingredients for the recipe" do
        pancakes = Recipe.create!(name: "Pancakes", complexity: 1, genre: "Breakfast")
        eggs = pancakes.ingredients.create!(name: "Eggs", cost: 3)
        milk = pancakes.ingredients.create!(name: "Milk", cost: 2)
        flour = pancakes.ingredients.create!(name: "Flour", cost: 5)

        visit "/recipes/#{pancakes.id}"

        expect(page).to have_content("Recipe for #{pancakes.name}")
        expect(page).to have_content("#{pancakes.genre} Recipe, Complexity: #{pancakes.complexity}")
        expect(page).to have_content("Ingredients Needed:")
        expect(page).to have_content("#{eggs.name}")
        expect(page).to have_content("#{milk.name}")
        expect(page).to have_content("#{flour.name}")
      end
    end
  end
end