class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :facility
  
  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end

  def self.reservations_after_three_month(facility)
    reservations = facility.reservations.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  def date_before_start
    if day < Date.current
      errors.add(:day, "は過去の日付は選択できません") 
    end
  end

  def date_current_today
    if day < (Date.current + 1)
      errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") 
    end 
  end

  def date_three_month_end
    if (Date.current >> 3) < day
      errors.add(:day, "は3ヶ月以降の日付は選択できません")
    end 
  end
  
  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end
end