feature 'Homepage' do
  scenario 'user can see temp in London for next 3 days' do
    visit "/visual-crossing-api"
    expect(page).to have_content 'London'
    expect(page).to have_content 'Manchester'
    expect(page).to have_content 'Sunderland'
  end

  scenario 'user can see temp in London for next 3 days' do
    visit "/open-weather-api"
    expect(page).to have_content 'London'
    expect(page).to have_content 'Manchester'
    expect(page).to have_content 'Sunderland'
  end
end