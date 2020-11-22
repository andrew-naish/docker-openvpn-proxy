# OpenVPN Proxy
A Privoxy container with OpenVPN  
Built on Alpine Linux so tiny, fast, light and awesome.

## Setup

### Docker

```
docker run -d --device=/dev/net/tun --cap-add=NET_ADMIN \
	--dns=1.1.1.1 --dns=1.0.0.1 \
    -e "OPENVPN_FILENAME=uk-london-aes128.ovpn" \
    -e "LOCAL_NETWORK=192.168.1.0/24" \
    -v ./openvpn-config:/app/ovpn/config \
    -p 8080:8080 \
    andymeful/privoxy-openvpn
```
`docker-compose.yml` has been included in the repository for reference.  

### Volume
1 volume needs to be mapped to `/app/ovpn/config` within the container.  
This volume should include any ovpn config files to be used and, credentials.txt.

### VPN Config
I've tested with PIAs ovpn configs but will probably work with any, just make sure to include the following line somewhere:
```
auth-user-pass /app/ovpn/config/credentials.txt
```
I plan to check for / automagically add this line in future.

I left in PIA London config for use if needed.  
Obviously you'll need to have a PIA account.

### Credentials
Create `./credentials.txt` in the directory which is mapped to `/app/ovpn/config`.   
On the 1st line put the username, on the 2nd line the password.

### Environment Variables

#### LOCAL_NETWORK
The CIDR mask of the local IP addresses which will be acessing the proxy. This is so the response to a request makes it back to the requestee.

#### OPENVPN_FILENAME
The .ovpn file to use. This file should be in the directory which is mapped to `/app/ovpn/config`.