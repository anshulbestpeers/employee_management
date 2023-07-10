class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :department, :designation

  def department
    object.department.name
  end

  def designation
    object.designation.name
  end
end
