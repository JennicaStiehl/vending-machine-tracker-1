require 'rails_helper'

RSpec.describe "As a visitor" do
  describe 'When I visit a snack show page' do
    it 'I see the name of that snack' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      doritos = dons.snacks.create!(name: "doritos", price: 2.50)

      owner2 = Owner.create(name: "jim's Snacks")
      sams  = owner2.machines.create!(location: "f's Mixed Drinks")
      doritos_2 = sams.snacks.create!(name: "doritos", price: 2.50)
      new_machine = doritos_2.machines.create(location: "The basemnt")
      visit snack_path(doritos.id)

      expect(page).to have_content(doritos.price)
      expect(page).to have_content(sams.location)
      expect(page).to have_content(new_machine.location)
      expect(page).to have_content(new_machine.avg_price)
      expect(page).to have_content(sams.avg_price)
      # expect(page).to have_content(doritos.count of the different kinds of items in that vending machine.
      end
    end
end
