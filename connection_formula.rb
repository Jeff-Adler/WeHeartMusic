def connection_calculator(bands,user_2)
    #this should be a user method. this takes the array from the user instance bands method and feeds it here
   score=0

   bands.each do |user1_band| 

    
    user_2.bands.each do |user2_band|

        if user1_band.id = user2_band.id
            score += (3 * (100 - user1_band.popularity)/100)


        else
             [country, rap, hip-hop] - [rap, hip-hop, dance]
           score += 1 - ((user1_band.genres -  user2.genres).size / user1_band.genres.size)
        end
    end
    score

    end

