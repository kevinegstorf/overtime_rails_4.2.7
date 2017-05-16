require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      user = User.create(email: 'test@test.com',
                          password: 'asdfasdf',
                          password_confirmation: 'asdfasdf',
                          first_name: 'Jon',
                          last_name: 'Snow'
                          )

      login_as(user, :scope => :user)

      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'some rationale'

      click_on 'Save'

      expect(page).to have_content('some rationale')
    end

    it 'will have a user associated it' do
  end
end
