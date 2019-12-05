class ApprovalsController < ApplicationController
  before_action :set_receiver, only: [:edit, :update]
  before_action :set_approval, only: [:edit, :update, :destroy]

  def new
    # errors.add(:name, :blank, message: "You cannot create a recommendation") if current_user == @receiver
    @doctors = policy_scope(User)
    @doctor = search_doctor_by_name(params[:name]) if params[:name].present?
    @approval = Approval.new(giver: current_user)
    @approval.receiver = @doctor
    authorize @approval
  end

  def create
    @approval = Approval.new(approval_params)
    authorize @approval
    @approval.giver = current_user

    @approval.specialty = @approval.receiver.specialties.first

    params[:name] = @approval.receiver.full_name
    if @approval.save
      flash[:notice] = "Recommendation successfully created."
      redirect_to dashboard_path(current_user)
    else
      flash[:alert] = "Error while creating the recommendation."
      render :new

    end
  end

  def edit
  end

  def update
    @approval.update(approval_params)
    if @approval.save
      flash[:notice] = "Recommendation successfully updated."
      redirect_to dashboard_path(current_user)
    else
      flash[:alert] = "Recommendation was not updated yet."
      render :edit
    end
  end

  def destroy
    if @approval.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path(current_user) }
        format.js
      #  TODO: Create flash: flash[:notice] = "Recommendation successfully deleted."
      end
    end
  end

  private

  def set_receiver
    @receiver = User.find(params[:doctor_id])
    authorize @receiver
  end

  def set_approval
      @approval = Approval.find(params[:id])
      authorize @approval
  end

  def search_doctor_by_name(search_input)
    User.search_by_name(search_input).where(id: @doctors).first
  end


  def approval_params
    params.require(:approval).permit(:content, :receiver_id, :headline, :anonymous, field_ids: [])
  end
end
