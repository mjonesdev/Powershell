# configuration of Server 2016

    set-displayresolution 1280 720

    Set-TimeZone "GMT Standard Time"
    Set-Date -Date "**/**/**** **:** AM PM"

# Static IP

    New-NetIPAddress -InterfaceAlias ethernet0 -IPAddress ***.***.***.*** -PrefixLength ** -DefaultGateway ***.***.***.***

#DHCP
    # Set-NetIPInterface -InterfaceAlias ethernet0 -Dhcp Enabled

# DNS setup

    Set-DnsClientServerAddress -InterfaceAlias ethernet0 -ServerAddresses ("***.***.***.***","***.***.***.***")

# Hostname

    Rename-Computer -NewName "****" -Restart

# Powershell remoting

    Enable-PSRemoting -Force

    # May need to add Workgroup server to Trusted Hosts on remoting PC to allow authentication
    # winrm set winrm/config/client '@{TrustedHosts="******"}'

# Firewall changes

    # Enable ping
        Set-NetFirewallRule -Name FPS-ICMP4-ERQ-IN, FPS-ICMP4-ERQ-OUT -Enabled True
    
    # Enable filesharing
        Enable-NetFirewallRule -DisplayGroup "File and Printer Sharing"

# FOR LAB ONLY
    # New-NetFirewallRule -DisplayName "Allow All Traffic" -Direction Inbound -Action Allow
    # New-NetFirewallRule -DisplayName "Allow All Traffic" -Direction Outbound -Action Allow

# Add to domain

    Add-Computer -DomainName "mattnet.lan" -Restart 