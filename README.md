# OpenVPN Proxy

A Privoxy container with OpenVPN - Built upon Alpine Linux so tiny, fast, light and awesome.

I've only included the UK and DE PIA ovpn files, because that's all I need. But you can generate you own here: https://www.privateinternetaccess.com/pages/ovpn-config-generator.

### If you roll your own PIA files
modify the auth-user-pass line to:
```
auth-user-pass /app-config/openvpn-credentials.txt
```

I plan to check / update this line automatically in future.

## Setup

```
docker run -d --device=/dev/net/tun --cap-add=NET_ADMIN \
    -e "OPENVPN_FILE_SUBPATH=pia/uk-london.ovpn" \
    -e "OPENVPN_USERNAME=null" \
    -e "OPENVPN_PASSWORD=null" \
    -e "LOCAL_NETWORK=192.168.1.0/24" \
    -v /etc/localtime:/etc/caltime:ro \
    -p 8080:8080 \
    andymeful/privoxy-openvpn

# Of course interpolating your own username and password above.. 
```

Also included a `docker-compose.yml`

### Environment Variables

#### LOCAL_NETWORK
The CIDR mask of the local IP addresses which will be acessing the proxy. This is so the response to a request makes it back to the client.

#### OPENVPN_FILE_SUBPATH
Currently implemented:
 - pia/uk-london.ovpn
 - pia/uk-manch.ovpn
 - pia/germany-frankf.ovpn

#### OPENVPN_USERNAME / OPENVPN_PASSWORD
Credentials to connect to PIA.
