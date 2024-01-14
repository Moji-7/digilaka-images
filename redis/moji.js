 i used this part of code the save the object of login response in redis
 
 and the tree model of saved data is ias this
 
 
 now please refactor api gateway controller and related service of that to handle this scenario:
 1- another request will come from client to api gatway (searchSellers) as get request with sample dto of query params
 2- the api getway will  after take the Authorization header from recieved client request and check of berear token is exit and valid, uses redis service
 3- if valid then call seller micor service related to search seller method and with payload and will dont wait for response
 4- after re tresult take back from seller mico service the emit happens and api gateway will send appropriate response to prior request of client