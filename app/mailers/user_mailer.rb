class UserMailer < ActionMailer::Base
  default from: 'troophub@flatironschool.com'

    def agenda_email(agenda)
	    @agenda = agenda
	    @url = "http://troop-hub.herokuapp.com/agenda/#{agenda_id}"
	    mail(:to => @agenda.email, :subject => 'Troop Meeting Planner from TroopHub!')
	    @agenda = Agenda.new(agenda_params)
	  end
end