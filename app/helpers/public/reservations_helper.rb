module Public::ReservationsHelper
  def times
    times = ["9:00",
             "9:30",
             "10:00",
             "10:30",
             "11:00",
             "11:30",
             "13:00",
             "13:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30"]
  end
  
  def check_reservation(reservaions, day, time)
    result = false
    reservations_count = @reservations.count
    if reservations_count > 1
      reservations each do |reservation|
        result reservation[:day].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end 
    elsif reservations_count == 1
       result = reservations[0][:day].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
       return result if result
     end 
     return result
   end 
end
