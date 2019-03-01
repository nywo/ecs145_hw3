otpClient <- function(host="localhost",port=2002){
	#open connection
	con <- socketConnection(host=host, port = port, blocking=TRUE,server=FALSE, open="r+")

	while(TRUE){
		f = readline(prompt="#otp ") #accept user input

		if(f == "ol") {
			serialize('ol',con)
			result <- unserialize(con)
			print(result)
		} else if (f == "get") {
			serialize('get', con)
			serialize(request,con)
			result<-unserialize(con)
			print(result)
		} else if (f == "put") {
			serialize('put', con)
			serialize(object, con)
			print("Put Finished\n")
			print(result)
		} else if (f == "exit") {
			close(con)
			print("Connection Closed\n")
			break
		} else {
			print("Error: request not recognized")

		}
	}

}

otpClient()
