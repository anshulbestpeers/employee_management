class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :date, :in_time, :out_time, :employee_id

  def in_time
    object.in_time.strftime("%H:%M:%S")
  end

  def out_time
    object.out_time.strftime("%H:%M:%S") if object.out_time
  end
end
