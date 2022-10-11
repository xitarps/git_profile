# frozen_string_literal: true

# Controller for Members CRUD
class MembersController < ApplicationController
  before_action :fetch_member, only: %i[show edit update destroy]
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    return redirect_to @member, notice: build_notice(act: 'created', model: @member) if @member.save

    flash.now[:alert] = @member.errors.full_messages.to_sentence
    render :new
  end

  def show; end

  def edit; end

  def update
    return redirect_to @member, notice: build_notice(act: 'updated', model: @member) if @member.update(member_params)

    flash.now[:alert] = @member.errors.full_messages.to_sentence
    render :edit
  end

  def destroy
    redirect_to root_path, notice: build_notice(act: 'destroyed', model: @member) if @member.destroy
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end

  def fetch_member
    @member = Member.find(params[:id])
  end

  def build_notice(**args)
    t("activerecord.successful.messages.#{args[:act]}",
      model: args[:model].model_name.human)
  end
end
