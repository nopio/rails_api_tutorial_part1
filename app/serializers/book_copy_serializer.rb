class BookCopySerializer < ActiveModel::Serializer
  attributes :id, :book, :user, :isbn, :published, :format

  def book
    instance_options[:without_serializer] ? object.book : BookSerializer.new(object.book, without_serializer: true)
  end

  def user
    return unless object.user
    instance_options[:without_serializer] ? object.user : UserSerializer.new(object.user, without_serializer: true)
  end
end
