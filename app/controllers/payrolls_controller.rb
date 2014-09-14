class PayrollsController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy,:show,:new,:create]
  before_filter :correct_user,only: [:edit, :update]
  before_filter :admin_user,only: :destroy
  # GET /payrolls
  # GET /payrolls.json
  def index
    @payrolls = Payroll.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payrolls }
      format.xls
    end
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
    @payroll = Payroll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payroll }
      format.xls
    end
  end

  # GET /payrolls/new
  # GET /payrolls/new.json
  def new
    @payroll = Payroll.new
    1.times do
      allowance = @payroll.allowances.build
    end
    1.times do
      deductions=@payroll.deductions.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payroll }
    end
  end

  # GET /payrolls/1/edit
  def edit
    @payroll = Payroll.find(params[:id])
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @payroll = Payroll.new(params[:payroll])

    respond_to do |format|
      if @payroll.save
        format.html { redirect_to @payroll, notice: 'Payroll was successfully created.' }
        format.json { render json: @payroll, status: :created, location: @payroll }
      else
        format.html { render action: "new" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payrolls/1
  # PUT /payrolls/1.json
  def update
    @payroll = Payroll.find(params[:id])

    respond_to do |format|
      if @payroll.update_attributes(params[:payroll])
        format.html { redirect_to @payroll, notice: 'Payroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payroll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll = Payroll.find(params[:id])
    @payroll.destroy

    respond_to do |format|
      format.html { redirect_to payrolls_url }
      format.json { head :no_content }
    end
  end
  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end
end
