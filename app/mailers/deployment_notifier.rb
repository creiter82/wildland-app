class DeploymentNotifier < ApplicationMailer
    default :from => 'AFR-Wildland-Admin@aurorawildlandteam.herokuapp.com'
    
    def send_deployment_roster(roster, personnel)
       @roster = roster
       @personnels = personnel
       emails = @personnels.collect(&:email).join(",")
       mail( 
           :to => [emails, 'fgray@auroragov.org', 'smills@auroragov.org', 'hhackbar@auroragov.org', 'rfields@auroragov.org', 'kallen@auroragov.org'],
           :subject => "AFR Wildland Deployment on #{Date.today}"
           )
    end
    
end
