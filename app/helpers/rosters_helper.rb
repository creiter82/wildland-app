module RostersHelper
  
  def deployment_email_helper(roster, app)
    @apparatus = app
    @deploy = @roster.assignments.where(alternate: false, apparatu_id: @apparatus)
    @can_deploy = @deploy.where(deploy: false)
    if !@can_deploy.any? && @roster.assignments.any?
      link_to 'Send Deployment Email', send_mail_path, id: @roster.id, class: 'btn btn-success'
    end
  end
  
end
