require 'redmine'

Redmine::Plugin.register :redmine_issue_attachments do
  name 'Redmine Issue Attachments plugin'
  author 'cockok'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/cockok/redmine_issue_attachments/'
  author_url 'http://github.com/cockok'

  project_module :issue_attachments do
    permission :issue_attachments, {:issue_attachments => [:index]}
  end

  menu :project_menu, :issue_attachments, { :controller => 'issue_attachments', :action => 'index' }, :caption => ':issue_attachments',
       #:if => Proc.new{|project|
       #           setting = CodeReviewProjectSetting.find_or_create(project)
       #           project.repository != nil  and setting and !setting.hide_code_review_tab},
       :after => :files
end
