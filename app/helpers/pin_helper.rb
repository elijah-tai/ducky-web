module PinHelper
  def get_image(image_url)

    if !image_url.include? "missing.png" #Image is present
      image_tag image_url
    else
      image_tag "emptyducky.jpeg"
    end 

  end 
  
  def format_output(req_desc) #Gets pin.description
  	#The purpose of this function is to prevent overflow of the text
  	#box due to extremely long words
  	#This will be rare if the users aren't fudging up the spacebar
  	#and are not deliberately trying to screw with things
    
    #The textbox can comfortably fit 15 m characters or like 50 i's
    desc_array = req_desc.split(" ")
    desc_array.each do |word|
    	
    	mult15 = (word.length/15).floor #Length of word in multiples of 15. A 34 character word as a mult15 length of 2
    	
    	if mult15 > 0

    		for i in 1..mult15
    			word.insert(15*i, "\n")
   	 		end

   	 	end
    end
    description = desc_array.join(" ")
    return description
  end 
end
