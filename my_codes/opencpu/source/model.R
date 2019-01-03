library(xgboost)
library(glmnet)
library(ElemStatLearn)

setwd("C:/Users/xujing.LAPTOP-LLR84L1D/Desktop/闭关修炼/闭关/R_online/my_codes/opencpu/source")

data <- save(spam,file='mail_data.rda')

x = as.matrix(spam[, -ncol(spam)])
y = as.numeric(spam$spam) - 1
xgbmodel = xgboost(data = x, label = y, nrounds = 5, objective = 'binary:logistic')
# 这里模型保存的路径可以自己设置
save(xgbmodel, file="xgb.rda")
# glmmodel = cv.glmnet(x = x, y = y, family = 'binomial')
# save(glmmodel, file="glm.rda")


xgb_model <- load("xgb.rda")
xgbmodel

data_spam <- as.matrix(spam[1, -ncol(spam)])
pred <- predict(xgbmodel,data_spam)
pred <- xgboost:::predict.xgb.Booster(object = xgbmodel, newdata = data_spam)
