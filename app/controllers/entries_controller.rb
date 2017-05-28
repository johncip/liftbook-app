
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
  def create
    initialize_entry

    if @entry.save
      render json: @entry
    else
      render json: {status: 'error', messages: @entry.errors.message}, status: 500
    end
  end

  def create_from_nickname
    initialize_entry

    if @entry.save
      render json: @entry
    else
      render json: {status: 'error', messages: @entry.errors.messages}, status: 500
    end
  end

  private

  def entry_params
    params.require(:entry).permit(%i[lift_id lift_name sets reps notes weight units])
  end

  def initialize_entry
    @entry = Entry.new(entry_params)
    @entry.units ||= current_user.units

    unless params[:lift_id]
      @entry.lift = Lift.find_or_create_by(user: current_user, nickname: params[:lift_name])
    end
  end
end
