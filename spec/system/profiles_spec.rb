require 'rails_helper'

RSpec.describe "プロフィール機能", type: :system do
  let(:user) { create :user }

  context 'ログインユーザーの時' do
    before do
      login(user)
      visit root_path
    end

    it 'プロフィールページにアクセスできる' do
      click_on 'マイページ'
      click_on 'プロフィール'
      expect(page).to have_content(user.email)
    end

    it 'プロフィールを編集できる' do
      click_on 'マイページ'
      click_on 'プロフィール'
      click_on 'test-edit-icon'
      fill_in 'ユーザーネーム', with: 'テストユーザー'
      click_button '更新'
      expect(page).to have_content('更新しました')
      expect(page).to have_content('テストユーザー')
    end
  end
end
