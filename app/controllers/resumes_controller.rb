class ResumesController < ApplicationController
  #load_and_authorize_resource
  before_action :authenticate_user!

  respond_to :docx

  def edit
  end

  def show
    respond_to do |format|
      format.html do
        pdf = MemberPdf.new(@resumes)
        send_data pdf.render, filename: 'member.pdf', type: "application/pdf", disposition: "inline"
      end
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to resume_path(@resume), notice: "The data of #{@resume.name} has been updated"
    end

  end

  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id
    # @resume.user_id = current_user.id
    if @resume.save
      redirect_to resumes_path, notice: "The data of #{@resume.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The data of #{@resume.name} has been deleted."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :phone_no, :cnic, :address, :avatar)
  end
end