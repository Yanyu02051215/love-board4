require "rails_helper"

RSpec.describe '質問機能' , type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:user_b) { FactoryBot.create(:user, gender:"ladys") }
  let!(:question) { FactoryBot.create(:question, user_id: user.id, title:"男性の質問") }
  let!(:question_b) { FactoryBot.create(:question, user_id: user_b.id, title:"女性の質問") }
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
        expect{
          visit question_path(question)
          click_on '削除'
          click_on '削除する'
          expect(page).to have_content '恋愛質問箱'
        }.to change(Question, :count).by(-1)
      end
    end
  end
  describe '質問回答機能' do
    context 'ログインして質問回答する時' do
      before do
        sign_in(user)
      end
      it '質問へ回答できる' do
        expect{
          visit question_path(question_b)
          click_on '回答する'
          fill_in "回答", with: '質問への回答'
          click_on '回答する'
          expect(page).to have_content '恋愛質問箱'
        }.to change(Answer, :count).by(1)
      end
      it '自分の質問に回答できない' do
        visit new_question_answer_path(question)
        expect(page).to have_content '恋愛質問箱'
      end
    end
    context 'ログインせず回答しようとする時' do
      it '回答画面に遷移できない' do
        visit new_question_answer_path(question_b)
        expect(page).to have_content '恋愛質問箱'
      end
    end
  end
  describe 'カテゴリー毎の質問表示機能' do 
    context 'メンズの時' do
      it "メンズの質問のみ表示される" do
        visit "/questions/men/select"
        expect(page).to have_content "男性の質問"
      end
    end
  end
end