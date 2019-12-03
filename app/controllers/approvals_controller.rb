class ApprovalsController < ApplicationController
  before_action :set_receiver, only: [:new, :create, :edit, :update]
  before_action :set_approval, only: [:edit, :update, :destroy]

  def new
    # errors.add(:name, :blank, message: "You cannot create a recommendation") if current_user == @receiver
    @approval = Approval.new(receiver: @receiver, giver: current_user)
    authorize @approval
  end

  def create
    @approval = Approval.new(approval_params)
    authorize @approval
    @approval.giver = current_user
    @approval.receiver = @receiver

    @approval.specialty = @receiver.specialties.first
    if @approval.save
      redirect_to doctor_path(@receiver)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @approval.update(approval_params)
    if @approval.save
      redirect_to dashboard_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @approval.destroy
    redirect_to dashboard_path(current_user)
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

  def approval_params
    params.require(:approval).permit(:content, :headline, :anonymous, field_ids: [])
  end
end
