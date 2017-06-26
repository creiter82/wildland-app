module RostersHelper
  
  def deployment_email_helper(roster)
    @deploy = @roster.assignments.where(alternate: false)
    @can_deploy = @deploy.where(deploy: false)
    if !@can_deploy.any?
      link_to 'Send Deployment Email', send_mail_path, id: @roster.id, class: 'btn btn-success'
    end
  end
  
end
