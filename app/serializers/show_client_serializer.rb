class ShowClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total

  def total
    self.object.memberships.sum(:charge)
  end

end
