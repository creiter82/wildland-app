class DeploymentNotifier < ApplicationMailer
    default :from => 'AFR-Wildland-Admin@aurorawildlandteam.herokuapp.com'
    
    def send_deployment_roster(roster, personnel)
       @roster = roster
       @personnels = personnel
       emails = @personnels.collect(&:email).join(",")
       mail( 
           :to => emails,
           :subject => "AFR Wildland Team Deployment on #{Date.today}"
           )
    end
    
end
