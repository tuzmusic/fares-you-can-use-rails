class VacationSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date
end
