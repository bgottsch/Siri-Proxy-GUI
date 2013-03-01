Download link: http://www.mediafire.com/download.php?dymsk6mzvpaf9yd

Version 1 Build 1

Installation

You must have SiriProxy server installed. This is only a GUI. To run just double-click the app icon. You may relocate it to the Applications folder. Configure it or leave it to default and run.

Acknowledgements

Thanks to Plamoni for his wonderful SiriProxy server. Check him on GitHub.
Thanks to the developers involved in this complex Siri custom commands server.

Buttons

Start: it starts the server in a Terminal window. This window will be hidden.
Stop: stops the running server by stopping all Ruby and Dnsmasq processes.
Restart: restarts the running server and bundles it. This will restart Dnsmasq.
Bundle: bundles the server. This will not affect Dnsmasq.
Update: updates the server to it's latest version from the original source.
Gencert: generates the required certificate. This certificate allows the computer to connect with the server.
Hide: hides all Siri Proxy and Terminal windows.
Show: shows all Siri Proxy and Terminal windows.

Text Fields

obs: leave the text fields blank for default configs.

Port: select the port to run the server.
IP: select the ip to run the server.
/SiriProxy: locate the SiriProxy installation folder. This is where the bin folder is. DO NOT select any other folder inside the SiriProxy folder. It MUST be SiriProxy
/.siriproxy: locate the other SiriProxy installation folder. This is where the config.yml file is.
Password: admin user password to activate the server. It DOES NOT share your password. If no password is inputed, the program will prompt for it when needed.

FAQ

This WILL NOT	install Siri on a non approved Apple iDevide, microwave, etc.
This is only a GUI for SiriProxy. It DOES NOT install the server. Maybe on future updates...
This program uses AppleScript for most of the code and a plist file in "~/Library/Application Support/Siri Proxy/". A possible solution for missing data or values is to delete the plist file. The program will create a new one.