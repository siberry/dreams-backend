class DreamTagSerializer < ActiveModel::Serializer
  attributes :tag_name, :interpretation, :id, :img_url, :created_at
end
