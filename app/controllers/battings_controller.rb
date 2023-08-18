class BattingsController < ApplicationController
  before_action :set_batting, only: %i[ show edit update destroy adding]

  # GET /battings or /battings.json
  def index
    @battings = Batting.all
  end

  # GET /battings/1 or /battings/1.json
  def show
    @stats=Batting.find(params[:id])
  end

  # GET /battings/new
  def new
    @batting = Batting.new
    @all=Player.all
  end

  # GET /battings/1/edit
  def edit
    @all=Player.all
    @record=Batting.find_by(params[:id])
  end

  def adding
    @all=Player.all 
  end

  def add
    @batting = Batting.find(params[:id]) 
    if @batting
      @e = Batting.find_by(id: @batting.id)

      if @e[:format] == params[:batting][:format] && @editstats[:player_id] == params[:batting][:player_id].to_i
        @e.matches += params[:batting][:matches].to_i
        @e.innings += params[:batting][:innings].to_i
        @e.runs += params[:batting][:runs].to_i
        @e.balls += params[:batting][:balls].to_i
        if @e.highest < params[:batting][:highest].to_i
          @e.highest = params[:batting][:highest].to_i
        else
          @e.highest=@e.highest.to_i
        end
        @e.notout += params[:battings]&.[](:notout).to_i || 0
        sr=(@e.runs/@e.balls).to_f*100
        @e.strikerate=sr
        if @e.notout != 0
          s=@e.runs/(@e.innings - @e.notout).to_f
          @e.avg=s.to_f.round(2)
        else
          @e.avg=@e.runs
        end
        @e.fours += params[:batting][:fours].to_i
        @e.sixes += params[:batting][:sixes].to_i
        @e.fif += params[:batting][:fif].to_i
        @e.hun += params[:batting][:hun].to_i
        @e.save
        redirect_to batting_path(@e.id)
      end
    end

  
end

  # POST /battings or /battings.json
  def create
    @all=Batting.where(player_id:params[:batting][:player_id])
    
    track=false

    @all.each do |x|
      if x.format == params[:batting][:format]
        track=true
        break
      end
    end
    if track
      redirect_to new_batting_path
    else
      @batting = Batting.new(batting_params)
      if @batting.save
        redirect_to batting_path(@batting.id)
      end
    end
     
  end
  # PATCH/PUT /battings/1 or /battings/1.json
  def update
    @editstats = Batting.find(params[:id])
      if @editstats[:format] == params[:batting][:format] && @editstats[:player_id] == params[:batting][:player_id].to_i
        if @editstats.update(batting_params)
          redirect_to batting_path(@editstats.id), notice: 'Batting data was successfully updated.'
        else
          render :edit 
        end
      else    
        redirect_to batting_path(params[:id]), alert: 'No batting data found for the specified format.'
      end
  end
  

  # DELETE /battings/1 or /battings/1.json
  def destroy
    @batting.destroy

    respond_to do |format|
      format.html { redirect_to battings_url, notice: "Batting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batting
      @batting = Batting.find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def batting_params
      params.require(:batting).permit(:format, :matches, :innings, :runs, :balls, :highest, :notout, :fours, :sixes, :fif, :hun, :strikerate, :avg, :player_id)
    end
end
