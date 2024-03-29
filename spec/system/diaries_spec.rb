require 'rails_helper'

RSpec.describe "投稿機能", type: :system do
  
  describe '投稿表示' do
    let(:user_a) { create :user }
    let(:user_b) { create :user }
    let!(:diary_a) { create :diary, user: user_a }
    let!(:diary_b) { create :diary, user: user_b }
    
    context '非ログインユーザーが閲覧している時' do
      it '投稿一覧が閲覧できる' do
        visit root_path
        expect(page).to have_content(diary_a.title)
        expect(page).to have_content(diary_b.title)
      end

      it 'リアクションボタンを押せる' do
        visit root_path
        click_on diary_a.title
        expect(page).to have_no_content '1'
        click_on 'test-like'
        expect(page).to have_content '1'
      end
    end

    context 'ユーザーAがログインしている時' do
      it '自分の投稿をツイッターに投稿できる' do
        login(user_a)
        visit root_path
        click_on diary_a.title
        expect(page).to have_selector('.tweet-icon')
        expect(current_path).to eq(diary_path(diary_a.id))
      end
    end

    context 'ユーザーBでログインしている時' do      
      it '他ユーザーの投稿はツイッター投稿できない' do
        login(user_b)
        visit root_path
        click_on diary_a.title
        expect(page).to have_no_selector('.tweet-icon')
      end
    end
  end
end
