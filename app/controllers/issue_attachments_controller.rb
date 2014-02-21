class IssueAttachmentsController < ApplicationController
  unloadable
    before_filter :find_project

  menu_item :issue_attachments

  #before_filter :find_project_by_project_id
  #before_filter :find_container, :only => [:show, :edit, :update]
  #before_filter :authorize

  helper :sort
  include SortHelper

  def index
    sort_init 'filename', 'asc'
    sort_update 'filename' => "#{Attachment.table_name}.filename",
                'created_on' => "#{Attachment.table_name}.created_on",
                'size' => "#{Attachment.table_name}.filesize",
                'downloads' => "#{Attachment.table_name}.downloads"

    @attachments = Attachment.find(:all, :order => sort_clause)
    ##@containers = [ Project.find(@project.id, :include => :attachments, :order => sort_clause)]
    ##@containers += @project.versions.find(:all, :include => :attachments, :order => sort_clause).sort.reverse

    #debugger

    #render :layout => !request.xhr?
  end
end
