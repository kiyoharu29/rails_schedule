class Schedule < ApplicationRecord
  validates :title, presence: true
  validates :start_day, presence: true
  validate :start_day,
  def not_before_end_day
    errors.add(:start_day, "は終了日以前の日付で選択してください") if start_day.nil? || start_day > end_day
  end
  validates :end_day, presence: true
  validate :end_day,
  def not_after_today
    errors.add(:end_day, "は今日以降の日付で選択してください") if end_day.nil? || end_day < Date.today
  end
  validates :memo, length: { in: 0..500 }
end
