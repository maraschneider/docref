class ApprovalsController < ApplicationController

  def new
    @doctor = User.find(params[:doctor_id])
    @approval = Approval.new(receiver: @receiver, giver: current_user)
    authorize @approval
  end

  def create
    @approval = Approval.new(approval_params)
    @approval.giver = current_user
    @approval.receiver = User.find(params[:doctor_id])
    authorize @approval
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def approval_params
    params.require(:approval).permit(:content, :fields, :headline)

  end
end
