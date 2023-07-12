class AttendanceSerializer < ActiveModel::Serializer
  attributes :attendance

  def attendance
    {
      date: object.date,
      in_time: object.in_time.strftime("%H:%M:%S"),
      out_time: object.out_time.strftime("%H:%M:%S")
    }
  end
end
