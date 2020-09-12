def fill_cleaning_room_form(cleaning_room)
  select cleaning_room.cleaning_date.day, from: 'cleaning_room[cleaning_date(3i)]'
  select I18n.t('date.month_names')[cleaning_room.cleaning_date.month], from: 'cleaning_room[cleaning_date(2i)]'
  select cleaning_room.cleaning_date.year, from: 'cleaning_room[cleaning_date(1i)]'
  select cleaning_room.room.to_label, from: 'cleaning_room[room_id]'
  find('input[type="submit"]').click
end

describe 'As a User' do
  scenario 'I can create a new cleaning room' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_room = FactoryGirl.build :cleaning_room

    visit new_cleaning_room_path

    fill_cleaning_room_form(cleaning_room)

    expect(current_path).to eq cleaning_rooms_path
    expect(page).to have_content 'Limpeza de Quarto criado com sucesso!'

    expected_cleaning_room = CleaningRoom.last
    expect(expected_cleaning_room.cleaning_date).to eq cleaning_room.cleaning_date
    expect(expected_cleaning_room.room.id).to eq cleaning_room.room.id
  end

  scenario 'I can edit a cleaning room' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_room = FactoryGirl.create :cleaning_room
    new_cleaning_room = FactoryGirl.build :cleaning_room

    visit edit_cleaning_room_path(cleaning_room)

    fill_cleaning_room_form(new_cleaning_room)

    expect(current_path).to eq cleaning_rooms_path
    expect(page).to have_content 'Limpeza de Quarto atualizado com sucesso!'

    expected_cleaning_room = CleaningRoom.find(cleaning_room.id)
    expect(expected_cleaning_room.cleaning_date).to eq new_cleaning_room.cleaning_date
    expect(expected_cleaning_room.room.id).to eq new_cleaning_room.room.id
  end

  scenario 'I can show a cleaning room' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_room = FactoryGirl.create :cleaning_room

    visit cleaning_room_path(cleaning_room)

    expect(page).to have_content cleaning_room.id
    expect(page).to have_content I18n.l cleaning_room.cleaning_date
    expect(page).to have_content cleaning_room.room.to_label
  end

  scenario 'I can destroy a cleaning room' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_room = FactoryGirl.create :cleaning_room

    visit cleaning_rooms_path

    find("a[href*='#{cleaning_room_path(cleaning_room)}'][data-method='delete']").click

    expect(current_path).to eq cleaning_rooms_path
    expect(page).to have_content 'Limpeza de Quarto excluído com sucesso!'

    expect(CleaningRoom.count).to eq 0
  end

  scenario 'I can list all cleaning rooms' do
    login_as FactoryGirl.create(:user), scope: :user

    cleaning_rooms = FactoryGirl.create_list :cleaning_room, 2

    visit cleaning_rooms_path

    cleaning_rooms.each do |cleaning_room|
      expect(page).to have_content cleaning_room.id
      expect(page).to have_content I18n.l cleaning_room.cleaning_date
      expect(page).to have_content cleaning_room.room.to_label
    end
  end
end
