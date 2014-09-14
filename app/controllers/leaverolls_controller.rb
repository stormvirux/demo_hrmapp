class LeaverollsController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy,:show,:new,:create,:index2]
  #before_filter :correct_user,only: [:edit, :update]
  before_filter :admin_user,only: :destroy

  # GET /leaverolls
  # GET /leaverolls.json
  def index
    @leaverolls = Leaveroll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaverolls }
    end
  end
  def index2
    @abc={}
    @leaverolls = Leaveroll.all
    @leaverolls_by_date=@leaverolls.group_by(&:lfrom)
    @leaverolls_by_date.each do |key,value|
      value.each do |x|
          (key..x.lto).each do |y|
          @abc[y]=value
          end
      end
    end
    @leaverolls_by_date.reverse_merge!(@abc)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leaverolls }
    end
  end
  # GET /leaverolls/1
  # GET /leaverolls/1.json
  def show
    @leaveroll = Leaveroll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leaveroll }
    end
  end

  # GET /leaverolls/new
  # GET /leaverolls/new.json
  def new
    @leaveroll = Leaveroll.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leaveroll }
    end
  end

  # GET /leaverolls/1/edit
  def edit
    @leaveroll = Leaveroll.find(params[:id])
  end

  # POST /leaverolls
  # POST /leaverolls.json
  def create
    @leaveroll = Leaveroll.new(params[:leaveroll])

    respond_to do |format|
      if @leaveroll.save
        format.html { redirect_to @leaveroll, notice: 'Leaveroll was successfully created.' }
        format.json { render json: @leaveroll, status: :created, location: @leaveroll }
      else
        format.html { render action: "new" }
        format.json { render json: @leaveroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leaverolls/1
  # PUT /leaverolls/1.json
  def update
    @leaveroll = Leaveroll.find(params[:id])

    respond_to do |format|
      if @leaveroll.update_attributes(params[:leaveroll])
        format.html { redirect_to @leaveroll, notice: 'Leaveroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leaveroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaverolls/1
  # DELETE /leaverolls/1.json
  def destroy
    @leaveroll = Leaveroll.find(params[:id])
    @leaveroll.destroy

    respond_to do |format|
      format.html { redirect_to leaverolls_url }
      format.json { head :no_content }
    end
  end
  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
