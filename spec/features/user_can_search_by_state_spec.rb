require 'rails_helper'

feature "user can search for members" do
    scenario "user submits valid state name" do
        visit '/'

        save_and_open_page

        select "Colorado", from: :state
        click_on "Locate Representatives"
        expect(current_path).to eq(search_path)

        within(first(".member")) do
            expect(page).to have_css(".name")
            expect(page).to have_css(".party")
            expect(page).to have_css(".state")
        end
    end
end