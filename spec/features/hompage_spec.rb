feature 'Homepage' do
  scenario 'user can see temp in London for next 3 days' do
    visit "/"
    expect(page).to have_content 'London'
    expect(page).to have_content 'Manchester'
    expect(page).to have_content 'Sunderland'
  end
end