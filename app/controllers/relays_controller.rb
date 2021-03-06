class RelaysController < ApplicationController
  
  before_action :authenticate_user!

  before_action :set_relay, only: [:show, :edit, :update, :destroy]
  before_action :set_event, except: [:update_payed, :update_picked_up]
  before_action :set_run, except: [:update_payed, :update_picked_up]

  include Pickupable  

  def index
    @page_topic = "Staffelanmeldungen"
    @relays = @run.relays.to_a.sort_by(&:finishtime)
  end

  def show
    @page_topic = "Staffelanmeldung"
  end

  def new
    @page_topic = "Neue Staffelanmeldung"
    @relay = @run.relays.new
    #raise
    4.times {@relay.enrollments.build(run_id: @run.id, event_id: @event.id)} if @relay.new_record?
  end

  def edit
    @page_topic = "Staffelanmeldung bearbeiten"
  end

  def create
    @page_topic = "Neue Staffelanmeldung"
    @relay = @run.relays.new(relay_params)
    respond_to do |format|
      if @relay.save#(validate: false)
        format.html { redirect_to event_run_relays_path(@event, @run), notice: 'Staffelanmeldung erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @relay }
      else
        format.html { render :new }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @page_topic = "Staffelanmeldung bearbeiten"
    respond_to do |format|
      if @relay.update(relay_params)
        format.html { redirect_to event_run_relays_path(@event, @run), notice: 'Staffelanmeldung erfolgreich aktualisiert.' }
        format.json { render :show, status: :ok, location: @relay }
      else
        format.html { render :edit }
        format.json { render json: @relay.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relay.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Staffelanmeldung erfolgreich gelöscht.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relay
      @relay = Relay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relay_params
      params.require(:relay).permit(:run_id, :startnumber, :name, :contact_title, :contact_name, :contact_firstname, :contact_street, :contact_city, :contact_zip, :contact_country, :contact_email, enrollments_attributes: [ :id, :runner_title, :runner_name, :runner_firstname, :runner_gender, :run_id, :event_id, :runner_date_of_birth])
    end

    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

    def set_runs      
      @runs = @event.runs.collect{|r| [r.name, r.id]}
    end

    def set_run
      @run = @event.runs.friendly.find(params[:run_id])
    end

end
