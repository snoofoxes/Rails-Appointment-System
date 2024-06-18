class Appointment < ApplicationRecord
  belongs_to :dentist
  belongs_to :user
  before_create :set_default_status
  validate :end_after_it_starts
  validates :dentist_id, presence: true
  validate :dentist_double_booked, if: -> { dentist.present? && starts_before_it_ends? }
  validates :user_id, presence: true
  validate :users_double_booked, if: -> { user.present? && starts_before_it_ends? }
  validates :status, inclusion: { in: %w(pending approved cancelled) }


 

  def dentist_double_booked
    return unless dentist

    this_start = self.start_time
    this_end = self.end_time
    conflict = self.dentist.appointments.any? do |appointment|
      other_start = appointment.start_time
      other_end = appointment.end_time
      other_start < this_end && this_end < other_end || other_start < this_start && this_start < other_end
    end
    errors.add(:dentist, "Has A Conflict Appointment") if conflict
  end




  def users_double_booked
    return unless user

    this_start = self.start_time
    this_end = self.end_time
    conflict = user.appointments.any? do |appointment|
      other_start = appointment.start_time
      other_end = appointment.end_time
      other_start < this_end && this_end < other_end || other_start < this_start && this_start < other_end
    end
    errors.add(:user, "Has A Conflict Appointment") if conflict
  end


  def end_after_it_starts
    if start_time >= end_time
    errors.add(:end_time, 'must be after start time')
    end
  end

  def starts_before_it_ends?
    start_time < end_time
  end

  def dentist_name
    self.dentist.firstname 
  end

  def user_name
    self.user.firstname || "Unknown User"
  end

  def self.by_dentist(dentist)
    where(dentist_id: dentist.id)
  end

  def self.upcoming
    where("start_time > ?", Time.now)
  end

  def self.past 
    where("start_time < ?", Time.now)
  end

  def self.most_recent
    order(start_time: :desc)
  end

  def self.longest_ago
    order(start_time: :asc)
  end

   private

  def set_default_status
      self.status ||= 'pending'
  end

  def approve!
    update!(status: 'approved')
  end

  def cancel!
    update!(status: 'cancelled')
  end


end
