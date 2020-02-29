require "rails_helper"

describe 'ユーザー関連情報', type: :system do
  describe 'ログイン機能' do
    let(:user) { FactoryBot.create(:user) }
    context '正しい値を入力したとき' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: user.password
        click_button 'ログイン'
      end
      it 'トップページが表示される' do
        expect(page).to have_content '恋愛質問箱'
      end
    end

  end
end