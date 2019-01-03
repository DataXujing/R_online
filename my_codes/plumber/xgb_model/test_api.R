library(xgboost)
library(ElemStatLearn)
library(plumber)

pr <- plumb('xgb_model/xgb_api.R')
pr$run(host='0.0.0.0',port=8088)
