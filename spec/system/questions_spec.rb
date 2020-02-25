require "rails_helper"

RSpec.describe '質問投稿機能' , type: :system do
  describe '質問表示機能' do
    # before do
        # user_a = FactoryBot.create(:user,name:'ユーザーA',email:'a@example.com')
        # question_a = FactoryBot.create(:question,title:'最初のタイトル',body:'最初の質問',user:user_a)
    # end

    # context 'ユーザーAがログインしている時' do
    #  before do
      # visit edit_question_path(5)

      visit root_path
      
      # fill_in :email ,with:'a@example.com'
      # fill_in :password ,with: 'password'
      # click_button 'ログイン'
    #  end
     

     it '質問一覧が表示される' do
      expect(page).to have_no_content 'ログイン'
      # expect(1 + 1).to eq 2
     end
    
  end
end