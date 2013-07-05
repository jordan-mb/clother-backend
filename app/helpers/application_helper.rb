module ApplicationHelper
  def s3_path(file)
    "https://s3-us-west-2.amazonaws.com/clotherphotos/assets/#{file}"
  end
end
