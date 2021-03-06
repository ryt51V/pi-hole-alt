Just a personal fork of https://github.com/pi-hole/pi-hole.  Use this at your own risk and don't expect any stability.

Branches beginning "alt/" are largely internal to the fork.  Other branches are close forks of the original, and most I have made or will make pull requests for.

# Changes from pi-hole

## Branches

- **dnsports**: Allows specifying a custom port for a custom DNS server.
- **Feature/ryt51V-sudo**: Better handling of sudo and the pihole user.
- **networkchoices**: Work properly with interfaces with multiple IPv4 addresses.  Allow the user to keep their current network reconfiguration.
- **webserverchoices**: Allows choosing manual web server configuration (for use with a web server you have brought up yourself).

- **alt/improveddialog**: Just what the dialog should be IMO.

## Unbranched changes in alt/master

### General

- Removed "chmod 777 hack".
- Moved several variables to a config file.
- Moved a few functions into an include file.
- Split variable files out of /etc/pihole to /var/lib/pihole.

### Web Server
- Can set up an apache vhost (IF it is already installed).
- The admin interface is split into a separate host listening on port 8080.
- The password asked during install is used to protect the admin interface at the web server level (lighttpd / apache).
