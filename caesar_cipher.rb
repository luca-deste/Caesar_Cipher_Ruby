letters = 'abcdefghijklmnopqrstuvwxyz'
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
Message = askForOperators

#def encryptMessage(msg,places,direction)
message = Message[:message_to_encode].split('')
idx = Message[:places_number_to_shift].to_i
encrMessage = []
message.each do |letter|
  if letters.include?(letter)
    index = letters.index(letter)
    if Message[:left_or_right] == 'r'
      puts 'right'
      newIndex = index + idx
      p index
      p idx
      if newIndex >= letters.length
        newIndex = (newIndex%letters.length) 
      end
    else
      newIndex = index - idx
      if newIndex < -letters.length
        newIndex = (newIndex%letters.length)
      end
    end
    encrMessage.push(letters[newIndex])
  else
    encrMessage.push(letter)
  end
end
p message
p encrMessage
