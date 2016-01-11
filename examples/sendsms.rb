require 'nasaramobileapiclient'

phone = "233244209193"
senderId = "Testing"
message = "hey there, this is a test message!"

smsApi = NasaraMobileApiClient.new("9EEPC38Eyf9N6Mc8beMEH")
result = smsApi.sendSms(phone, senderId, message)

if(result == '1801')
  puts "message sent successfully"
elsif(result == '1802')
  puts "message sending failed"
elsif(result == '1803') 
  puts "invalid login phone or password given"
elsif(result == '1804') 
  puts "not enough sms credit"
elsif(result == '1805') 
  puts "sender id must be more than 1 character and less than 12 characters"
elsif(result == '1806') 
  puts "phone number must be more than 8 characters"
end
