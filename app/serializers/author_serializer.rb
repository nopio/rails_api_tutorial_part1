class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :books
end
