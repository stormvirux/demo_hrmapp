class LeavetypesController < ApplicationController
    before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy,:show,:new,:create]
  before_filter :correct_user,only: [:edit, :update]
  before_filter :admin_user,only: :destroy

  # GET /leavetypes
  # GET /leavetypes.json
  def index
    @leavetypes = Leavetype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leavetypes }
    end
  end

  # GET /leavetypes/1
  # GET /leavetypes/1.json
  def show
    @leavetype = Leavetype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leavetype }
    end
  end

  # GET /leavetypes/new
  # GET /leavetypes/new.json
  def new
    @leavetype = Leavetype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leavetype }
    end
  end

  # GET /leavetypes/1/edit
  def edit
    @leavetype = Leavetype.find(params[:id])
  end

  # POST /leavetypes
  # POST /leavetypes.json
  def create
    @leavetype = Leavetype.new(params[:leavetype])

    respond_to do |format|
      if @leavetype.save
        format.html { redirect_to @leavetype, notice: 'Leavetype was successfully created.' }
        format.json { render json: @leavetype, status: :created, location: @leavetype }
      else
        format.html { render action: "new" }
        format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leavetypes/1
  # PUT /leavetypes/1.json
  def update
    @leavetype = Leavetype.find(params[:id])

    respond_to do |format|
      if @leavetype.update_attributes(params[:leavetype])
        format.html { redirect_to @leavetype, notice: 'Leavetype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leavetypes/1
  # DELETE /leavetypes/1.json
  def destroy
    @leavetype = Leavetype.find(params[:id])
    @leavetype.destroy

    respond_to do |format|
      format.html { redirect_to leavetypes_url }
      format.json { head :no_content }
    end
  end
  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
