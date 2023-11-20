class LendableBookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :status, :due_date, :library_name

  def author
    object.parent_book.author
  end

  def title
    object.parent_book.title
  end

  def library_name
    object.library.name
  end
end
