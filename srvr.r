OptServer <- function(nclnt, port=2002){
	#initialize data frame with names, code courtesy of
	#https://stackoverflow.com/questions/32712301/create-empty-data-frame-with-column-names-by-assigning-a-string-vector
	master_data <- data.frame(matrix(ncol = 3, nrow = 0))
	names <- c("ObjectName", "NBytes", "ObjectClass")
	colnames(master_data) <- names
	con <- socketConnection(host="localhost", port = port, blocking=TRUE,server=TRUE, open="r+")

	while(TRUE){
		order <- unserialize(con)

		if(order == "ol"){
			print("Ol called")
			serialize(master_data,con)
		}

		else if(order == "put"){
			print("put called")
			object <- unserialize(con)
			put(object)
		}

		else if(order == "get"){
			print("get called")
			request<-unserialize(con)
			get(request)
		}
	}
#separate data into function type (ol, get, or put) and do
#certain things based on the type

	put <- function(stuff) {
		nbyte <- object.size(stuff) #returns size of object
		classtype <- class(stuff) #returns type of object
		stuff2put <- c(stuff, nbyte, classtype) #makes a list of object's properties
		master_data 
	}

	get <- function(request){
		serialize(,con)
	}

# response <- toupper(data) 
#     writeLines(response, con) 
#     close(con)

}
OptServer()