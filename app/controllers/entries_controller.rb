
#  id         :integer          not null, primary key
#  lift_id    :integer
#  sets       :integer          not null
#  reps       :integer          not null
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :decimal(100, 6)  not null
#  units      :string           not null
#  workout_id :integer

class EntriesController < ApplicationController
  before_action :load_workout
  before_action :load_entry, only: [:destroy]
  before_action :initialize_entry, only: [:create, :create_from_nickname]

  def index
    @entries = @workout.entries
  end

  def create
    if @entry.save
      render json: @entry
    else
      render_error_json
    end
  end

  def create_from_nickname
    if @entry.save
      redirect_to workout_entries_path(@workout)
    else
      render_error_json
    end
  end

  def destroy
    if @entry.delete
      redirect_to workout_entries_path(@workout)
    else
      render_error_json
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:lift_id, :lift_name, :sets, :reps, :notes, :weight, :units)
  end

  def lift_params
    params.require(:lift).permit(:nickname)
  end

  def load_entry
    @entry = Entry.find(params[:id])
  end

  def load_workout
    @workout = Workout.find(params[:workout_id])
  end

  def initialize_entry
    @entry = @workout.entries.new
    @entry.update_attributes(entry_params)
    @entry.units ||= current_user.units

    return if params[:lift_id]
    @entry.lift = Lift.find_or_create_by_user_and_nickname(current_user, lift_params[:nickname])
  end

  def render_error_json
    render json: {status: 'error', messages: @entry.errors.messages}, status: 500
  end
end
