class ContributorsController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @contributors = Contributor.all.page(params[:page]).per(15)
  end

  def edit
  end

  def show
  end

  def new
  	@contributor = Contributor.new
  end

  def create
    @contributor = Contributor.new(params[:contributor])
    if @contributor.save
      redirect_to contributors_path, :notice => "Kontributor berhasil dibuat."
    else
      render "new"
    end
  end

  def update
    @contributor = Contributor.find params[:id]
    if @contributor.update_attributes(params[:contributor])
      redirect_to @contributor, :notice => "kontributor berhasil di-update."
    else
      render "edit"
    end
  end

  def edit
    @contributor = Contributor.find params[:id]
  end

  def destroy
    @contributor = Contributor.find params[:id]
    @contributor.destroy
    redirect_to contributors_path
  end
end
