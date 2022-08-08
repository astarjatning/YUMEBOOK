require 'rails_helper'

RSpec.describe "ユーザー機能", type: :system do

  describe '会員登録機能' do
  
    let(:registered_user) { create :user }

    before do
      visit root_path
      click_on('新規登録')
    end

    context '未登録ユーザーの時' do
      it '会員登録ができる' do
        fill_in 'ユーザーネーム', with: 'unregistered_user'
        fill_in 'メールアドレス', with: 'unregistered_user@example.com'
        fill_in 'パスワード(6文字以上)', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        check 'test-terms'
        click_button '登録'
        expect(page).to have_content '登録しました'
        expect(current_path).to eq root_path
      end
    end

    context '登録済みユーザーの場合' do
      it '登録できない' do
        fill_in 'ユーザーネーム', with: registered_user.name
        fill_in 'メールアドレス', with: registered_user.email
        fill_in 'パスワード(6文字以上)', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        check 'test-terms'
        click_button '登録'
        expect(page).to have_no_content '登録しました'
        expect(page).to have_content 'メールアドレスはすでに存在します'
        expect(current_path).to eq(users_path)
      end
    end
  end
end
