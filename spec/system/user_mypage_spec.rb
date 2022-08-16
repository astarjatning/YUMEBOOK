require 'rails_helper'

RSpec.describe "マイページでの機能", type: :system do
  let(:user_a) { create(:user) }
  let(:user_b) { create(:user) }
  let!(:diary_a) { create(:diary, user: user_a) }
  let!(:diary_b) { create(:diary, user: user_b) }
  let!(:diary_yesterday) { create(:diary, :diary_yesterday, user: user_a) }
  context '非ログインユーザーの時' do
    it '非ログインユーザー用コンテンツが表示されている' do
      visit root_path
      expect(page).to have_content 'ログイン'
      expect(page).to have_no_content 'マイページ'
    end
  end

  context 'ユーザーAでログインしている時' do
    before do
      login(user_a)
    end

    it 'ログインユーザー向けのコンテンツになっている' do
      expect(page).to have_content '投稿する'
      expect(page).to have_content 'マイページ'
      expect(page).to have_content 'ログアウト'
    end

    it 'マイページにアクセスできる' do
      click_on 'マイページ'
      expect(page).to have_content(Date.today.year)
      expect(page).to have_content(Date.today.month)
      expect(page).to have_content(diary_a.title)
      expect(page).to have_no_content(diary_b.title)
    end

    it 'ユーザーAの投稿のみが表示されている' do
      click_on 'マイページ'
      expect(page).to have_content diary_a.title
      expect(page).to have_content diary_yesterday.title
      expect(page).to have_no_content diary_b.title
    end
    
    it '日付ごとの投稿が見れる' do
      click_on 'マイページ'
      click_on(Date.today.day)
      expect(page).to have_content diary_a.title
      expect(page).to have_no_content diary_yesterday.title
    end
  end
  
  context 'ユーザーBでログインしている時' do
    it 'ユーザーBの投稿のみが表示されている' do
      login(user_b)
      click_on 'マイページ'
      expect(page).to have_content diary_b.title
      expect(page).to have_no_content diary_a.title
    end
  end
end
