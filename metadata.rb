name             'hopsworks'
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      "Installs/Configures the HopsHub Dashboard"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1"

%w{ ubuntu debian centos rhel }.each do |os|
  supports os
end

depends 'glassfish'
depends 'ndb'
depends 'kagent'
depends 'hops'

recipe  "hopsworks::install", "Installs HopsHub/Glassfish"

#link:Click <a target='_blank' href='http://%host%:8080/hopsworks'>here</a> to launch hopsworks in your browser (http)
#link:Click <a target='_blank' href='https://%host%:8181/hopsworks'>here</a> to launch hopsworks in your browser (https)
recipe  "hopsworks", "Installs HopsWorks war file, starts glassfish+application."

#
# Required Attributes
#
attribute "hopsworks/smtp/server",
          :display_name => "Smtp server address for sending emails",
          :description => "Smtp server address for sending emails",
          :type => 'string',
          :required => "required",
          :default => "smtp.gmail.com"

attribute "hopsworks/smtp/port",
          :display_name => "Smtp server port for sending emails",
          :description => "Smtp server port for sending emails",
          :type => 'string',
          :required => "required",
          :default => "465"

attribute "hopsworks/smtp/secure",
          :display_name => "Use SSL to Smtp server",
          :description => "Use SSL to Smtp server",
          :type => 'string',
          :required => "required",
          :default => "true"

attribute "hopsworks/smtp/username",
          :display_name => "Email account username",
          :description =>  "Email account username",
          :type => 'string',
          :required => "required",
          :default => "sodugling@gmail.com"

attribute "hopsworks/smtp/password",
          :display_name => "Email account password",
          :description =>  "Email account password",
          :type => 'string',
          :required => "required",
          :default => "admin"

#
# Optional Attributes
#

attribute "hopsworks/admin/user",
          :description => "Username for Hops Admin account",
          :type => 'string',
          :default => "admin"

attribute "hopsworks/admin/password",
          :description => "hopsworks/admin/password",
          :type => 'string',
          :default => "changeit"

attribute "karamel/master/password",
          :description => "karamel/master/password",
          :type => 'string',
          :default => "changeit"

attribute "hopsworks/cert/password",
          :description => "hopsworks/cert/password",
          :type => 'string',
          :default => "changeit"

attribute "hopsworks/twofactor_auth",
          :description => "hopsworks/twofactor_auth",
          :type => 'string',
          :default => "false"

attribute "karamel/cert/cn",
          :description => "Certificate Name",
          :type => 'string',
          :default => "hops.kth.se"

attribute "karamel/cert/o",
          :description => "organization",
          :type => 'string',
          :default => "kth"

attribute "karamel/cert/ou",
          :description => "Organization unit",
          :type => 'string',
          :default => "ict"

attribute "karamel/cert/l",
          :description => "Location",
          :type => 'string',
          :default => "kista"

attribute "karamel/cert/s",
          :description => "City",
          :type => 'string',
          :default => "stockholm"

attribute "karamel/cert/c",
          :description => "Country (2 letters)",
          :type => 'string',
          :default => "se"

attribute "glassfish/version",
          :description => "glassfish/version",
          :type => 'string',
          :default => '4.1'

attribute "glassfish/user",
          :description => "glassfish/user",
          :type => 'string',
          :default => "glassfish"

attribute "glassfish/group",
          :description => "glassfish/group",
          :type => 'string',
          :default => "glassfish-admin"

attribute "glassfish/admin/port",
          :description => "glassfish/admin/port",
          :type => 'string',
          :default => 4848

attribute "glassfish/port",
          :description => "glassfish/port",
          :type => 'string',
          :default => 8080

attribute "glassfish/max_mem",
          :description => "glassfish/max_mem",
          :type => 'string',
          :default => 4000

attribute "glassfish/min_mem",
          :description => "glassfish/min_mem",
          :type => 'string',
          :default => 2500

attribute "glassfish/max_stack_size",
          :description => "glassfish/max_stack_size",
          :type => 'string',
          :default => 512

attribute "glassfish/max_perm_size",
          :description => "glassfish/max_perm_size",
          :type => 'string',
          :default => 1024

attribute "kagent/enabled",
          :display_name => "Install kagent",
          :description =>  "Install kagent",
          :type => 'string',
          :default => "false"

