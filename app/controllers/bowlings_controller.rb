class BowlingsController < ApplicationController
  before_action :set_bowling, only: %i[ show edit update destroy adding]

  # GET /bowlings or /bowlings.json
  def index
    @bowlings = Bowling.all
  end

  # GET /bowlings/1 or /bowlings/1.json
  def show
    @stats=Bowling.find(params[:id])
    @current_user_email = session[:user_email]
  end

  # GET /bowlings/new
  def new
    @all=Player.all
    @bowling = Bowling.new
  end

  # GET /bowlings/1/edit
  def edit
    @all=Player.all
    @record=Bowling.find_by(params[:id])
  end

  def adding
    
    @all=Player.all 
  end

  def add
    @current_user_email = session[:user_email]
    @bowling = Bowling.find(params[:id]) 

    if @bowling
      @e = Bowling.find_by(id: @bowling.id)

      if @e[:format] == params[:bowling][:format] && @e[:player_id] == params[:bowling][:player_id].to_i
        @e.matches += params[:bowling][:matches]
        @e.innings += params[:bowling][:innings]
        @e.runs += params[:bowling][:runs]
        @e.balls += params[:bowling][:balls]
        @e.maidens += params[:bowling][:maidens]
        @e.wickets += params[:bowling][:wickets]
        @e.fourw += params[:bowling][:fourw]
        @e.fifw += params[:bowling][:fifw]
        d=@e[:bbi].split("/")
        f=params[:bowling][:bbi].split("/")
        if d[0]<f[0]
          @e.bbi = params[:bowling][:bbi]
        else
          @e.bbi=@e.bbi
        end
        @e.save
        redirect_to bowling_path(@e.id)
        oversbowled=(@e.balls/6).to_f.round(2)
        @e.economy=@e.runs/oversbowled
        @e.strikerate=@e.balls/@e.wickets
        @e.avg=@e.runs/@e.wickets 
      end
    end
  end

  # POST /bowlings or /bowlings.json
  def create
    @all=Bowling.where(player_id:params[:bowling][:player_id])
    
    track=false

    @all.each do |x|
      if x.format == params[:bowling][:format]
        track=true
        break
      end
    end
    if track
      redirect_to new_bowling_path
    else
      @bowling = Bowling.new(bowling_params)
      if @bowling.save
        redirect_to bowling_path(@bowling.id)
      end
    end
     
  end

  # PATCH/PUT /bowlings/1 or /bowlings/1.json
  def update
    @editstats = Bowling.find(params[:id])
      if @editstats[:format] == params[:bowling][:format] && @e[:player_id] == params[:bowling][:player_id].to_i
        if @editstats.update(bowling_params)
          redirect_to bowling_path(@editstats.id), notice: 'Bowling data was successfully updated.'
        else
          render :edit 
        end
      else    
        redirect_to bowling_path(params[:id]), alert: 'No bowling data found for the specified format.'
      end
  end

  # DELETE /bowlings/1 or /bowlings/1.json
  def destroy
    @bowling.destroy

    respond_to do |format|
      format.html { redirect_to bowlings_url, notice: "Bowling was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bowling
      @bowling = Bowling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bowling_params
      params.require(:bowling).permit(:format, :matches, :innings, :balls, :runs, :maidens, :wickets, :fourw, :fifw, :bbi, :strikerate, :economy, :avg, :player_id)
    end
end
