Rails.application.config.after_initialize do
  ActiveRecord::Base.connection_pool.disconnect!

  # Do awesome threaded stuff here
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.connection_pool.instance_variable_set('@size', 15)
  	ActiveRecord::Base.connection_pool.instance_variable_set('@timeout', 10)
    ActiveRecord::Base.establish_connection(config)
  end
end