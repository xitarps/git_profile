# frozen_string_literal: true

# Controller for Members CRUD
class MembersController < ApplicationController
  before_action :fetch_member, only: %i[show edit update destroy]
  def new
    @member = Member.new
    @member.repositories.build
  end

  def create
    @member = Member.new(member_params)

    return redirect_to @member, notice: build_notice(act: 'created', model: @member) if @member.save

    flash.now[:alert] = @member.errors.full_messages.to_sentence
    render :new
  end

  def show
    @repository = @member.repositories.first
  end

  def edit; end

  def update
    return redirect_to @member, notice: build_notice(act: 'updated', model: @member) if @member.update(member_params)

    @member.repositories = [@member.repositories.first] if @member.repositories.any?
    flash.now[:alert] = @member.errors.full_messages.to_sentence
    render :edit
  end

  def destroy
    redirect_to root_path, notice: build_notice(act: 'destroyed', model: @member) if @member.destroy
  end

  def search
    members = Member.find_with_any_column(search_params[:arg])
    repositories = Repository.find_with_any_column(search_params[:arg])
    @members = (members + repositories.map(&:member)).uniq
  end

  private

  def member_params
    params.require(:member).permit(:name, repositories_attributes: %i[url])
  end

  def search_params
    params.require(:search).permit(:arg)
  end

  def fetch_member
    @member = Member.find(params[:id])
  end

  def build_notice(**args)
    t("activerecord.successful.messages.#{args[:act]}",
      model: args[:model].model_name.human)
  end
end
