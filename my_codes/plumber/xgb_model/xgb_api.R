
#* Logging
#* @filter logger
function(req){
  model <<- load("xgb_model/xgb.rda")
  cat(as.character(Sys.time()), "-", 
      req$REQUEST_METHOD, req$PATH_INFO, "-", 
      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR,"\n")
  plumber::forward()
}

# xgb_api

#* XGBoost predict model
#* @param id The row id of Spam data.
#* @serializer unboxedJSON
#* @get /predict
function(id){
  if(as.integer(id) <= 4601){
    data_spam <- as.matrix(spam[as.integer(id), -ncol(spam)])
    pred <- predict(xgbmodel,data_spam)
    # pred <- xgboost:::predict.xgb.Booster(object = xgbmodel, newdata = data_spam)
    list(spam_id = id, predict = pred)
  }
  else{
    stop('Your id error')
  }

}

#* static source
#* @assets xgb_model/static /home
list()
