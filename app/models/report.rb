class Report < ActiveRecord::Base
  attr_accessor :start_date, :start_time, :end_date, :end_time
  before_validation :set_start_date_time, :set_end_date_time

  belongs_to :user
  belongs_to :trek

  validates :user, presence: true
  validates :trek, presence: true

  validates :starts_at, presence: true
  validates_datetime :starts_at
  validates_datetime :ends_at, after: :starts_at, allow_blank: true
  # validates_time :duration, allow_nil: true
  validates :distance, numericality: true, allow_nil: true
  validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }, allow_nil: true
  validates :public, inclusion: { in: [true, false] }
  validates :report, presence: true

  def set_start_date_time
    self.starts_at = Time.zone.parse("#{start_date} #{start_time}")
  end

  def set_end_date_time
    self.ends_at = Time.zone.parse("#{end_date} #{end_time}")
  end

  def self.convert_to_seconds(str)
    hours = str.split(":").first.to_i
    minutes = str.split(":").last.to_i
    hours * 60 * 60 + minutes * 60
  end

  def public?
    self.public
  end
end
