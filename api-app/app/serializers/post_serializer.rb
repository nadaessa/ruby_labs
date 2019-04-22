class PostSerializer < ActiveModel::Serializer

  attributes :post_title, :post_body

  def post_title
    object.title.upcase
  end

  def post_body
    object.body.upcase
  end

end
