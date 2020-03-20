require "rails_helper"

describe 'ユーザー関連情報', type: :system do
let(:user) { FactoryBot.create(:user) }
let(:user_b) { FactoryBot.create(:user, gender:"ladys") }
  describe 'ログイン機能' do
    context '正しい値を入力したとき' do
      before do
        sign_in(user)
      end
      it 'トップページが表示される' do
        expect(page).to have_content '恋愛質問箱'
      end
    end
  end
  describe 'ユーザー編集機能' do
    context 'ログインしてユーザー編集する時' do
      before do
        sign_in(user)
      end
      it 'ユーザー情報が編集される' do
        visit edit_user_path(user)
        fill_in "名前", with: '名前変更'
        click_on '更新'
        expect(page).to have_content '恋愛質問箱'
      end
    end
    context 'ログインしてない時' do
      it 'ユーザー編集画面に遷移できない' do
        visit edit_user_path(user)
        expect(page).to have_content '恋愛質問箱'
      end
    end
    context '他のユーザーでログインしている時' do
      it 'ユーザー編集画面に遷移できない' do
        visit edit_user_path(user_b)
        expect(page).to have_content '恋愛質問箱'
      end
    end
  end
end