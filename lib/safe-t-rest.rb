require 'rest-client'
require 'base64'
	

class SafeTRest
	attr_accessor(:extenstion_id, :username, :password, :url, :role_id, :guid)

	def getAppsProcessState
		a = RestClient::Request.execute(
   			:method => :post,
   			:url => @url,
   			:headers => {
   			:servletRequestID => 'MethodRequest',
   			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetAppsProcessState: ['#{@guid}', false]}"
   			}
		)
	end

	def getPackageFileList
		a = RestClient::Request.execute(
   			:method => :post,
   			:url => @url,
   			:headers => {
   			:servletRequestID => 'MethodRequest',
   			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetPackageFileList: ['#{@guid}']}"
   			}
		)
	end

	def iVerifyUserAccount
		a = RestClient::Request.execute(
   			:method => :post,
   			:url => @url,
   			:headers => {
   			:servletRequestID => 'MethodRequest',
   			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iVerifyUserAccount: ['#{@username}', '#{@password}', true]}"
   			}
		).split(':')
		return [a[0], Base64.decode64(a[1])].join(':')
	end

   def iGetHistory(days)
      a = RestClient::Request.execute(
            :method => :post,
            :url => @url,
            :headers => {
            :servletRequestID => 'MethodRequest',
            :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iGetHistory: ['#{@username}', '#{@password}', #{days}]}"
            }
      )
   end



end
