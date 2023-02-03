#Install dataset to find thr usarrests 
install.packages("dataset")

#load dataset
data("USArrests")

#assign data to varaible to start data prep
data_frame <- USArrests

#removing missing values in dataframe
data_frame <-na.omit(data_frame)

#standarization or scalling values
data_frame <- scale(data_frame)


#remove comment to show the diff before and after scale
#view(USArrests)
#view(data_frame)

summary(data_frame)

help("kmeans")

km <- kmeans(data_frame,3,15)
km$cluster
km$centers
km$withinss

plot(data_frame,col=km$cluster)
points(km$centers,col=1:3,pch=8)

#AS SHOWN its not the best clustring 
#so lets see how to find the best k to cluster the data

#we will apply the kmeans algorithms 10 time to calc wss and select elbow
# wss <- sum( Xi - Mean)^2
wss=numeric(10)
for(i in 1:10) 
  wss[i]<- sum(kmeans(data_frame,i)$withinss)
plot (1:10,wss,type="b",xlab = "K NUMBER",ylab="wss within groups sum of squares")
 
#As shown the best k  number of clusters are 4 

kmbest<-kmeans(data_frame,4)
kmbest$cluster
kmbest$centers
kmbest$withinss

plot(data_frame,col=kmbest$cluster)
points(kmbest$centers,col=1:4,pch=8)
