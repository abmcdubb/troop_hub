class AgendaController < ApplicationController
  before_action :set_agenda, only: [:show]
  #prawnto :prawn => { :top_margin => 75 }

  def index
    @agendas = Agenda.all
  end

  def new
    @agenda = Agenda.new
  end

  def create
    @agenda = Agenda.create(agenda_params)
    #@badges = Badge.all
      respond_to do |format|
        if @agenda.save
          format.html { redirect_to agenda_show_path(@agenda), notice: 'Agenda was successfully created.' }
        else
          format.html { render action: 'new' }
        end
    end   
  end

  def show
    @agenda = Agenda.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = AgendaPdf.new(@agenda)
        send_data pdf.render, filename: "agenda.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
  end

  def edit
  end

  def update
    @agenda = Agenda.find(params[:id])
      UserMailer.agenda_email(@agenda).deliver

      redirect_to agenda_show_path, notice: 'Agenda was successfully sent.'
  end

  def destroy
  end

    private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.require(:agenda).permit(:name, :meeting_date, :location, :activity_1, :activity_2, :activity_3, :activity_4, :activity_5, :activity_6, :patches, :snack, :jobs, :supplies, :troop_info)
  end
end
