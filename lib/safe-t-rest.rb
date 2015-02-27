require 'rest-client'

	

class SafeTRest
	attr_accessor(:extenstion_id, :method, :username, :password, :url, :role_id, :guid)

	def getAppsProcessState
		a = RestClient::Request.execute(
   			:method => :post,
   			:url => @url,
   			:headers => {
   			:servletRequestID => 'MethodRequest',
   			:BusinessLogic => "{Username:'#{@username}', Passowrd:'#{@password}', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetAppsProcessState: ['#{@guid}', false]}"
   			}
		)
	end

	def getPackageFileList
		a = RestClient::Request.execute(
   			:method => :post,
   			:url => @url,
   			:headers => {
   			:servletRequestID => 'MethodRequest',
   			:BusinessLogic => "{Username:'#{@username}', Passowrd:'#{@password}', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetPackageFileList: ['#{@guid}', false]}"
   			}
		)
	end
end
