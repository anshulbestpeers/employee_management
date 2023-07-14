class SalarySerializer < ActiveModel::Serializer
  attributes :id, :month, :net_income, :total_leaves
end
