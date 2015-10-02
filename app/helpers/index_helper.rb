module IndexHelper
	def format_output(req_desc) #Gets request.description
  	#The purpose of this function is to prevent overflow of the text
  	#box due to extremely long words
  	#This will be rare if the users aren't fudging up the spacebar
  	#and are not deliberately trying to screw with things
    
    #The textbox can comfortably fit 16 m characters or like 50 i's
    desc_array = req_desc.split(" ")
    desc_array.ech do |word|
    	
    	mult16 = (word.length/16).floor #Length of word in multiples of 16. A 34 character word as a mult16 length of 2
    	
    	if mult16 > 0

    		for i in 1..mult16
    			word.insert(16*i, '-')
   	 		end

   	 	end
    end
    desc_array.join(" ")
  end 
end
