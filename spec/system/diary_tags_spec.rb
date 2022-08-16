require 'rails_helper'

RSpec.describe "タグ機能", type: :system do
  let(:user) { create(:user) }
  
  describe 'タグ付き投稿' do
    context '新しくタグ付きの投稿をする時' do
      it 'タグ付きの投稿ができる' do
        login(user)
        click_on '投稿する'
        fill_in 'タイトル', with: 'テストタイトル'
        fill_in 'ストーリ', with: 'テストストーリー'
        fill_in 'タグ', with: 'テスト タグ'
        click_button '投稿'
        expect(page).to have_content '#テスト'
        expect(page).to have_content '#タグ'
      end
    end

    context '投稿がある時' do
      let(:diary_1) { create(:diary, user: user) }
      let(:diary_2) { create(:diary, user: user) }

      before do
        login(user)
        visit diary_path(diary_1)
        click_on 'test-diary-edit'
        fill_in 'タグ', with: 'テスト タグ'
        click_button '投稿'

        visit diary_path(diary_2)
        click_on 'test-diary-edit'
        fill_in 'タグ', with: 'テスト'
        click_button '投稿'
      end

      it '編集でタグを追加できる' do
        visit root_path
        expect(page).to have_content '#テスト'
        expect(page).to have_content '#タグ'
      end

      it 'タグでフィルタリングできる' do
        visit diary_path(diary_1)
        click_on '#テスト'
        expect(page).to have_content diary_1.title
        expect(page).to have_content diary_2.title
        click_on '#タグ'
        expect(page).to have_content diary_1.title
        expect(page).to have_no_content diary_2.title
      end
    end
  end
end