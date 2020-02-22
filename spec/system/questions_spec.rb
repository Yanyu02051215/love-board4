require "rails_helper"

RSpec.describe '質問投稿機能' , type: :system do
  describe '質問表示機能' do
    before do
        user_a = FactoryBot.create(:user,name:'ユーザーA',email:'a@example.com')
        FactoryBot.create(:question,name:'最初の質問',user:user_a)
    end

    context 'ユーザーAがログインしている時' do
     before do
      visit login_path
      fill_in 'メールアドレス',with:'a@example.com'
      fill_in 'パスワード',with: 'password'
      click_button 'ログインする'
     end

     it 'ユーザーAが質問した内容が表示される' do
      expect(page).to have_context '最初のタスク'
     end
    end
  end
end