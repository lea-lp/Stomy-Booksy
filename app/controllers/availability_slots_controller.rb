class AvailabilitySlotsController < ApplicationController

  def index
    if params[:teacher_id]
      @teacher = Teacher.find(params[:teacher_id])
      @availability_slots = AvailabilitySlot.where(teacher_id: @teacher.id)
    elsif params[:resource_id]
      @resource = Resource.find(params[:resource_id])
      @availability_slots = AvailabilitySlot.where(resource_id: @resource.id)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @availability_slot = AvailabilitySlot.new
  end

  def create
  end

  def destroy
  end
end
