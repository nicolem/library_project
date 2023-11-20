class ParentBookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :availability

  def availability
    object.next_available.available_string
  end
end
