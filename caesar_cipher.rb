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
  encrMessage = []
  message = msg.split('')
  places = places.to_i
  message.each do |letter|
    if letters.include?(letter)
      index = letters.index(letter)
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
      encrMessage.push(letters[newIndex])
    else
      encrMessage.push(letter)
    end
  end
  return encrMessage.join('')
end

Message = askForOperators

secretMessage = encryptMessage(Message[:message_to_encode],Message[:places_number_to_shift],Message[:left_or_right])
p secretMessage