class SearchesController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :destroy,:show,:new,:create]
  before_filter :correct_user,only: [:edit, :update]
  before_filter :admin_user,only: :destroy

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
      format.xls
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was performed.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
