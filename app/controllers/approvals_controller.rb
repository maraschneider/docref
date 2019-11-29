class ApprovalsController < ApplicationController
  before_action :set_receiver, only: [:new, :create]
  def new
    @approval = Approval.new(receiver: @receiver, giver: current_user)
    authorize @approval
  end

  def create
    @approval = Approval.new(approval_params)
    @approval.giver = current_user
    @approval.receiver = @receiver
    authorize @approval
    if @approval.save
      redirect_to doctor_path(@receiver)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_receiver
    @receiver = User.find(params[:doctor_id])
  end

  def approval_params
    params.require(:approval).permit(:content, :fields, :headline)

  end
end