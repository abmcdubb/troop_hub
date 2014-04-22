class AgendaController < ApplicationController
  before_action :set_agenda, only: [:show]

  def index
    @agendas = Agenda.all
  end

  def new
    @agenda = Agenda.new
  end

  def create
    @agenda = Agenda.create(agenda_params)
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
        # THIS SHOULD ALL BE IN A CLASS, LIKE AN UPLOADER OR SOMETHING
        html = render_to_string(partial: 'agenda.html.erb')
        pdf = PDFKit.new(html, :page_size => 'Letter', :quiet => false)
        stylesheet = TroopHub::Application.assets.find_asset('application.css').source
        filename = "agenda_#{@agenda.id}.pdf"
        if Rails.env == 'production'
          path = "#{RAILS_ROOT}/tmp/#{filename}"
          stylesheet_path = "#{RAILS_ROOT}/tmp/#{filename}_css.css"
          File.open(stylesheet_path, "w+") do |f|
            f.write(stylesheet)
          end
        else
          path = "tmp/#{filename}"
          stylesheet_path = "tmp/#{filename}_css.css"
          File.open(stylesheet_path, "w+") do |f|
            f.write(stylesheet)
          end
        end
        pdf.stylesheets << stylesheet_path
        file = pdf.to_file(path)
        AWS::S3::S3Object.store(
          filename,
          open(path),
          "troop-hub",
          access: :public_read
        )
        redirect_to "https://troop-hub.s3.amazonaws.com/#{filename}"
      end
    end
  end

  def edit
  end

  def update
    # @agenda = Agenda.find(params[:id])
    #   UserMailer.agenda_email(@agenda).deliver

    #   redirect_to agenda_show_path, notice: 'Agenda was successfully sent.'
  end

  def destroy
  end

    private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.require(:agenda).permit(:name, :meeting_date, :location, :activity_1, :activity_2, :activity_3, :activity_4, :activity_5, :activity_6, :badges, :snack, :jobs, :supplies, :troop_info)
  end
end
