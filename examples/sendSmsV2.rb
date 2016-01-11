require 'nasaramobileapiclient'
require 'rubygems'
require 'json'

phoneNumbers = "233xxxxxxxxx, 24342xxxxxx"
groups = ""
contactIds = ""
senderId = "NTesting"
message = "hey there, this is a test message!"

smsApi = NasaraMobileApiClient.new("9EEPC38Eyf9N6Mc8beMEH")
response = smsApi.sendSmsVersionTwo(phoneNumbers, senderId, message)
response = JSON.parse(response)

