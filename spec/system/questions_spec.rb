require "rails_helper"

RSpec.describe '質問機能' , type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question) }
  describe '質問作成機能' do
    context 'ログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
      end
      context '全てを入力したとき' do
        before do
        visit new_question_path
        fill_in 'タイトル', with: 'テストの質問'
        select '愛情表現', from: 'カテゴリー'
        fill_in '本文', with: 'テストの本文'
        click_button '質問投稿'
        end
        it '質問一覧が表示される' do
          expect(page).to have_content 'テストの質問'
        end
      end
    end
  end
  describe '質問編集機能' do
    context 'ログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
      end
      context 'タイトル変更した時' do
        before do
          visit edit_question_path(question)
          fill_in question[title], with: '質問の変更'
          click_on '質問編集'
        end
        it '質問一覧が表示される' do
          expect(page).to have_content '質問の変更'
        end
      end
    end
  end
end