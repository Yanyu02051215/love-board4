require "rails_helper"

RSpec.describe '質問機能' , type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user) }
  let!(:question) { FactoryBot.create(:question, user_id: user.id) }
  describe '質問作成機能' do 
    context 'ログインしている時' do
      before do
        sign_in(user)
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
    context 'ログインしてない時' do
      it '質問投稿画面に遷移できない' do
        visit new_question_path
        expect(page).to have_content '恋愛質問箱'
      end
    end
  end
  describe '質問編集機能' do
    context 'ログインしている時' do
      before do
        sign_in(user)
      end
      it '質問一覧が表示される' do
        visit edit_question_path(question)
        fill_in "タイトル", with: '質問の変更'
        click_on '質問編集'
        expect(page).to have_content '質問の変更'
      end
    end
    context 'ログインしてない時' do
      it '質問画面に遷移できない' do
        visit edit_question_path(question)
        expect(page).to have_content '恋愛質問箱'
      end
    end
  end
  describe '質問削除機能' do
    context 'ログインして質問削除する時' do
      before do
        sign_in(user)
      end
      it '質問が削除される' do
        visit question_path(question)
        click_on '削除'
        click_on '削除する'
        expect(page).to have_content '恋愛質問箱'
        expect{}.to change(Question, :count).from(1).to(0)
      end
    end
    # context 'ログインせず質問削除する時' do
    #   it '削除されない' do
    #     visit question_path
    #     expect(page).to have_content '恋愛質問箱'
    #   end
    # end
  end
end