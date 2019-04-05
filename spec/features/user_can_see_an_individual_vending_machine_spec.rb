require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "I see the name of all of the snacks associated with that vending machine, it also shows  their price" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      doritos = dons.snacks.create!(name: "doritos", price: 2.50)
      visit machine_path(dons)

      expect(page).to have_content(doritos.name)
      expect(page).to have_content(doritos.price)
  end
  scenario "I also see an average price for all of the snacks in that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    doritos = dons.snacks.create!(name: "doritos", price: 2.50)
    drPepper = dons.snacks.create!(name: "drPepper", price: 3.50)
    visit machine_path(dons)

    expect(page).to have_content("Avg Price: #{dons.avg_price}")
  end
end
