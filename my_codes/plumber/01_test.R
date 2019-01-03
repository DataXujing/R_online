# 01_test.R

#* Echo the param that was sent in
#* @param msg The message to echo back
#* @get /echo
function(msg=""){
  list(msg=paste0("The message is(echo的信息是):",msg))
}

#* Plot the iris data
#* @param spec If provided,filter the data to only this species(e.g. 'setosa')
#* @get /plot
#* @png
function(spec){
  myData <- iris
  title <- "All Species"
  
  # filter
  if(!missing(spec)){
    title <- paste0('Only the',spec, ' Species')
    myData <- subset(iris,Species == spec)
  }
  
  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title,xlab='Sepal Length',ylab="Petal Length")
}