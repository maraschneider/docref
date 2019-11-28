class ApprovalsController < ApplicationController

  def new
    @approval = Approval.new
    authorize @approval
    @approval.receiver = User.find(params[:doctor_id])
    @approval.giver = current_user
  end

  def create
    @approval = Approval.new(approval_params)
    @approval.receiver = User.find(params[:doctor_id])
    @approval.giver = current_user
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def approval_params
    params.require(:approval).permit(:content)

  end
end
