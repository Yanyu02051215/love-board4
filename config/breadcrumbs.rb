crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path
end

crumb :edit_user do
  link "マイページ編集", edit_user_path
end

crumb :rank_user do
  link "ユーザーランキング"
end

crumb :rank_pv do
  link "閲覧ランキング"
end

crumb :rank_question do
  link "質問ランキング"
end

crumb :gender do |gender|
  link "#{gender}の質問"
end

crumb :category do |category|
  link "#{category}の質問"
end

crumb :age do |age|
  link "#{age}の質問"
end

# crumb :root do
#   link "Home", root_path
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).