module PinHelper
  def get_image(image_url)

    if !image_url.include? "missing.png" #Image is present
      image_tag image_url
    else
      image_tag "emptyducky.jpeg"
    end 

  end 
end
