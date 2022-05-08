package main

import (
	"fmt"
	"net"
	"net/http"
)

//	response local ip address
func handler(w http.ResponseWriter, r *http.Request) {
	netInterfaceAddresses, _ := net.InterfaceAddrs()
	for _, netInterfaceAddress := range netInterfaceAddresses {
		networkIp, ok := netInterfaceAddress.(*net.IPNet)
		if ok && !networkIp.IP.IsLoopback() && networkIp.IP.To4() != nil {
			ip := networkIp.IP.String()
			fmt.Fprintf(w, "My Local IP Address is %v\n", ip)
		}
	}
}

//	run http server
func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":80", nil)
}
