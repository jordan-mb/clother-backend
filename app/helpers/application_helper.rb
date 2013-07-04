module ApplicationHelper
  def s3_path(img)
    "http://s3-us-west-2.amazonaws.com/clotherphotos/assets/#{img}"
  end
end
