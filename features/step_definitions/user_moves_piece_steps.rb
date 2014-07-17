Given 'I start a new game' do
  visit root_path
  set_test_mode
  click_button "New Game"
end

When 'I click on a pawn' do
  pawn_element = first('.white_pawn')
  pawn_element.click
  @pawn_id = pawn_element['data-id']
end

When 'I right click on a space in front of that pawn' do
  pawn_element = get_pawn
  pawn_x = pawn_element['data-x'].to_i
  pawn_y = pawn_element['data-y'].to_i
  @new_x = pawn_x
  @new_y = pawn_y + 5
  space = "$('.space[data-x=#{pawn_x}][data-y=#{@new_y}]')"
  page.execute_script "#{space}.trigger({ type: 'mousedown', which: 3 });"
end

Then 'that pawn should move to that space' do
  pawn_element = get_pawn
  expect(pawn_element['data-x'].to_i).to eq @new_x
  expect(pawn_element['data-y'].to_i).to eq @new_y
end

def get_pawn
  find("[data-id='#{@pawn_id}']")
end
