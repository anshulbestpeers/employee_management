class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :department

  def department
    object.department.name
  end
end
