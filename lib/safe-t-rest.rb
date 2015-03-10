require 'rest-client'
  
class SafeTRest
  attr_accessor(:extenstion_id, :username, :password, :url, :role_id, :guid)

  def get_apps_process_state
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetAppsProcessState: ['#{@guid}', false]}"
      }
    )
  end

  def get_package_file_list
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', GetPackageFileList: ['#{@guid}']}"
      }
    )
  end

  def verify_user_account
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iVerifyUserAccount: ['#{@username}', '#{@password}', true]}"
      }
    )
  end

  def get_user_history(days)  
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iGetHistory: ['#{@username}', '#{@password}', #{days}]}"
      }
    )
  end

  def user_account_address_list
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iUserAccountAddressList: ['#{@username}', '#{@password}']}"
        }
    )
  end

  def get_folder_list(path)
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iGetFolderList: ['#{@username}', '#{@password}', #{false}, #{true}, '#{path}', 417]}"
        }
      )
  end

  def safe_share_file(args)
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iSafeShareFile: ['#{@username}', '#{@password}', '#{args[:files]}', '#{args[:recipients]}', '#{args[:sender_name]}', '#{args[:sender_address]}', '#{args[:subject]}', '#{args[:message]}', #{args[:message_encryption_level]}, #{args[:delivery_method]}, '#{args[:mobile_recipient]}', #{args[:return_receipt]}, #{args[:safe_reply]}, #{args[:max_downloads]}, #{args[:package_expiry]}, '#{args[:folder_path]}', #{args[:root_folder_id]}]}"
        }
    )
  end

  def file_upload(args)
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iFileUpload: ['#{@username}', '#{@password}', '#{args[:file_base64]}', '#{args[:file_name]}', '#{args[:folder_path]}', #{args[:root_folder_id]}]}"
      }
    )
  end

  def file_download(args)
    RestClient::Request.execute(
      :method => :post,
      :url => @url,
      :headers => {
        :servletRequestID => 'MethodRequest',
        :BusinessLogic => "{Username:'', Password:'', RoleID: '#{@role_id}', ExtensionID: '#{@extenstion_id}', iFileDownload: ['#{@username}', '#{@password}', '#{args[:file_name]}', '#{args[:folder_path]}', #{args[:root_folder_id]}]}"
      }
    )
  end

end
