require 'rest-client'
	
class SafeTRest
	attr_accessor(:extenstion_id, :username, :password, :url, :role_id, :guid)

	def getAppsProcessState
		RestClient::Request.execute(
			:method => :post,
			:url => @url,
			:headers => {
			:servletRequestID => 'MethodRequest',
			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetAppsProcessState: ['#{@guid}', false]}"
			}
		)
	end

	def getPackageFileList
		RestClient::Request.execute(
			:method => :post,
			:url => @url,
			:headers => {
			:servletRequestID => 'MethodRequest',
			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetPackageFileList: ['#{@guid}']}"
			}
		)
	end

	def iVerifyUserAccount
		RestClient::Request.execute(
			:method => :post,
			:url => @url,
			:headers => {
			:servletRequestID => 'MethodRequest',
			:BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iVerifyUserAccount: ['#{@username}', '#{@password}', true]}"
			}
		)
	end

   def iGetHistory(days)
      RestClient::Request.execute(
         :method => :post,
         :url => @url,
         :headers => {
         :servletRequestID => 'MethodRequest',
         :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iGetHistory: ['#{@username}', '#{@password}', #{days}]}"
         }
      )
   end

   def iUserAccountAddressList
      RestClient::Request.execute(
         :method => :post,
         :url => @url,
         :headers => {
         :servletRequestID => 'MethodRequest',
         :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iUserAccountAddressList: ['#{@username}', '#{@password}']}"
         }
      )
   end

   def iGetFolderList(path)
      RestClient::Request.execute(
         :method => :post,
         :url => @url,
         :headers => {
         :servletRequestID => 'MethodRequest',
         :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iGetFolderList: ['#{@username}', '#{@password}', #{false}, #{true}, '#{path}', 417]}"
         }
      )
   end


end
