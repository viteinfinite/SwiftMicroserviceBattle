//import KituraRouter
//import KituraNet
//import KituraSys
//
//let router = Router()
//
//router.get("/") {
//request, response, next in
//    response.status(HttpStatusCode.OK).send("Hello, World!")
//    next()
//}
//
//let server = HttpServer.listen(8090, delegate: router)
//Server.run()
//

#if os(Linux)
import Glibc
#else
import Darwin
#endif

import Curassow
import Inquiline
import Foundation

public func parseAddress() -> Address {
  let args = Array(Process.arguments[1..<Process.arguments.count])
  var port = 9080 // default port
  var ip = "0.0.0.0" // default ip
  if args.count == 2 && args[0] == "-bind" {
    let tokens = args[1].bridge().componentsSeparatedByString(":")
    if (tokens.count == 2) {
      ip = tokens[0]
      if let portNumber = Int(tokens[1]) {
        port = portNumber
      }
    }
  }
  let address = Address(ip: ip, port: UInt16(port))
  return address
}

let address = parseAddress()
print(address)

serve { request in
  return Response(.Ok, contentType: "text/plain", body: "Hello World")
}