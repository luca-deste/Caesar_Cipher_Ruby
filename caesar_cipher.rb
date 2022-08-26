def askForOperators()
  response = {}
  puts "Write here your secret message"
  response[:message_to_encode] = gets.chomp
  puts "Now tell me how many places would you like your letters to shift"
  response[:places_number_to_shift] = gets.chomp
  puts "Great! you want to shift to the left or to the right? s/r"
  response[:left_or_right] = gets.chomp
  return response
end

def encryptMessage(msg,places,direction)
  letters = 'abcdefghijklmnopqrstuvwxyz'
  upletters = letters.upcase
  encrMessage = []
  message = msg.split('')
  places = places.to_i
  message.each do |letter|
    if letters.include?(letter) || upletters.include?(letter)
      index = letters.index(letter) || index = upletters.index(letter)
      if direction == 'r'
        puts 'right'
        newIndex = index + places
        p index
        p places
        if newIndex >= letters.length
          newIndex = (newIndex%letters.length) 
        end
      else
        newIndex = index - places
        if newIndex < -letters.length
          newIndex = (newIndex%letters.length)
        end
      end
      if letter == letter.upcase
        encrMessage.push(upletters[newIndex])
      else
        encrMessage.push(letters[newIndex])
      end
    else
      encrMessage.push(letter)
    end
  end
  return encrMessage.join('')
end

def askForMethod
  puts "Hello User! What would you like to do today?"
  puts "Encrypt or Decrypt? e/d"
  result = gets.chomp
  if result == 'e'
    message = askForOperators
    secretMessage = encryptMessage(message[:message_to_encode],message[:places_number_to_shift],message[:left_or_right])
    puts secretMessage
    puts "Do you need to do something else? y/n"
    response = gets.chomp
    if response == 'y'
      askForMethod
    else
      puts "thanks for using this product, be kind and leave a star on github (https://github.com/luca-deste/Caesar_Cipher_Ruby) to support it! See you next time!"
    end
  elsif result == 'd'
    puts 'not ready now'
  else
    puts "We were not ready for this response!"
  end
end

    
askForMethod