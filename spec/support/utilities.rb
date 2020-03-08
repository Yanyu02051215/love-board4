def sign_in(user)
visit new_user_session_path
fill_in 'メールアドレス', with: user.email
fill_in 'パスワード', with: user.password
click_button 'ログイン'
end

def sign_in_b(user_b)
  visit new_user_session_path
  fill_in 'メールアドレス', with: user_b.email
  fill_in 'パスワード', with: user_b.password
  click_button 'ログイン'
end