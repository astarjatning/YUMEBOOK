require 'rails_helper'

RSpec.describe "ゆめ投稿機能", type: :system do
  
  describe '一覧表示機能' do
    let!(:user_a) { create :user }
    let!(:user_b) { create :user }
    let!(:diary_a) { create :diary, user: user_a }
    let!(:diary_b) { create :diary, user: user_b }
    
    context '非ログインユーザーが閲覧している時' do
      it '投稿一覧が閲覧できる' do
        # 最新の投稿10件が画面上に表示されている事を確認
        visit root_path
        expect(page).to have_content(diary_a.title)
        expect(page).to have_content(diary_b.title)
      end
    end

    context 'ユーザーAがログインしている時' do
      before do
        login(user_a)
        visit root_path
      end

      it '自分の投稿をツイッターに投稿できる' do
        click_on diary_a.title
        expect(page).to have_selector('.tweet-icon')
        expect(current_path).to eq(diary_path(diary_a.id))
      end

      it 'ログインユーザー向けのコンテンツになっている' do
        # 画面上に投稿する・マイページ・ログアウトメニューが表示されている事を確認
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
    end

    context 'ユーザーBでログインしている時' do
      before do
        login(user_b)
        visit root_path
      end

      it 'ユーザーBのマイページにアクセスできる' do
        click_on 'マイページ'
        expect(page).to have_content(diary_b.title)
        expect(page).to have_no_content(diary_a.title)
      end

      it '他ユーザーの投稿はツイッター投稿できない' do
        click_on diary_a.title
        expect(page).to have_no_selector('.tweet-icon')
      end
    end
  end
end
