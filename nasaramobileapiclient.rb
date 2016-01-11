require 'cgi'
require 'uri'
require 'net/http'


def url_encode(hash)
   hash.map{|k,v| "#{CGI.escape(k)}=#{CGI.escape(v)}"}.join("&")
end 


class NasaraMobileApiClient
	def initialize(apiKey)
	  @api_key = apiKey
	  @baseUrl = "http://sms.nasaramobile.com/api/"
	  @baseUrlArguments = "?api_key=" + @api_key
	end

	def sendSms(phone, senderID, message)
	  query = {'api_key' => @apiKey,
		   'phone' => phone,
		   'sender_id' => senderID,
		   'message' => message
		  }

          url = @baseUrl + '?' + url_encode(query)
          uri = URI.parse(url)

          response = Net::HTTP.get(uri)		
	end

        def checkCredit(queryData=nil)
	  genericGetRequest('accounts/credit', queryData)
	end

	def sendSmsVersionTwo(phoneNumbers, senderId, message, groups=nil, contactIds=nil)
	  query = { 'api_key' => @apiKey,
		    'phone_numbers' => urlencode(phoneNumbers),
		    'sender_id' => senderId,
		    'message' => message
		  }

          url = @baseUrl+'v2/sendsms'
          uri = URI.parse(url)

          response = Net::HTTP.post_form(uri, query)
	end

	def fetchContacts(queryData=nil)
          genericGetRequest('v2/contacts', queryData)
	end

	def fetchContactDetails(contactId, queryData=nil)
	  genericGetRequest('v2/contacts/'+contactId.to_s, queryData)
	end

        def fetchGroups(queryData=nil)
          genericGetRequest('v2/groups/', queryData)
	end

	def fetchGroupDetails(groupId, queryData=nil)
          genericGetRequest('v2/groups/'+groupId.to_s+queryData)
	end

	def fetchAccountCredit(queryData=nil)
          genericGetRequest('v2/accounts/credit', queryData)
        end

	def genericGetRequest(url, queryData=nil)
	  if not(queryData)
	    queryData = {'api_key' => @api_key}
	  end
	
	  query = queryData
	  url = @baseUrl + url + '?' + url_encode(queryData)
          uri = URI.parse(url)

          response = Net::HTTP.get(uri)		
	end

	private :genericGetRequest

end

