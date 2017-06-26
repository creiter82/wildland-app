# Preview all emails at http://localhost:3000/rails/mailers/deployment_notifier
class DeploymentNotifierPreview < ActionMailer::Preview

    def welcome
        DeploymentNotifier.send_deployment_roster(Roster.find(30), Personnel.all)
    end
end
