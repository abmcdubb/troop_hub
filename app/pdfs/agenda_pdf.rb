class AgendaPdf< Prawn::Document

  def initialize(agenda)
    super()
    @agenda = agenda
    text "Meeting Date:  \##{@agenda.meeting_date.strftime("%a %b %e %Y")}"
    text "Location:  \##{@customer.location}"
    text "Start-up Activity:  \##{@agenda.activity_1}"
    text "Activity:  \##{@customer.activity_2}"
  end

end