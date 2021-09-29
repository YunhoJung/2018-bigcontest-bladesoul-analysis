Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
rm(list=ls())
getwd()
setwd("../data/real_last")
if(!require(dplyr)) install.packages("dplyr"); library(dplyr)
if(!require(data.table)) install.packages("data.table"); library(data.table)
if(!require(clusterGeneration)) install.packages("clusterGeneration"); library(clusterGeneration)
if(!require(mnormt)) install.packages("mnormt"); library(mnormt)
if(!require(randomForest)) install.packages("randomForest"); library(randomForest)
if(!require(caret)) install.packages("caret"); library(caret)
# 데이터로드
train<-read.csv('EDA_train2.csv')
test<-read.csv('EDA_test2.csv')
label<-read.csv('train_label.csv')
# 분류기준 들어있는 total_list
checker<-read.csv('total_list.csv')
# 전처리위해 train,test set 합치기
new <-rbind(train[,-c(2)],test)


#A1: normal 그룹
A1<- checker %>% group_by(acc_id) %>% summarise(normal = if(normal_id==1){normal=1}else{normal=NA})
#A2: hard 그룹
A2<- checker %>% group_by(acc_id) %>% summarise(hard = if(hard_id==1){hard=1}else{hard=NA})
#B1: bottom_auto 그룹
B1<- checker %>% group_by(acc_id) %>% summarise(ant = if(ant_id==1){ant=1}else{ant=NA})
#B2: top_auto 그룹
B2<- checker %>% group_by(acc_id) %>% summarise(master = if(master_id==1){master=1}else{master=NA})
#C1: person그룹 
C1<- checker %>% group_by(acc_id) %>% summarise(person = if(person_id==1){person=1}else{person=NA})
#C2: auto그룹
C2<- checker %>% group_by(acc_id) %>% summarise(auto = if(auto_id==1){auto=1}else{auto=NA})
#C3: 고속성장캐릭터 그룹
C3<- checker %>% group_by(acc_id) %>% summarise(jump = if(jump_id==1){jump=1}else{jump=NA})
#C4: X8610그룹
C4<- checker %>% group_by(acc_id) %>% summarise(X8610 = if(X8610_id==1){X8610=1}else{X8610=NA})    
  
#해당군집에 속하는 acc_id 추출
normal<- A1  %>% filter(!is.na(normal))
hard <- A2 %>% filter(!is.na(hard))
bottom<- B1 %>% filter(!is.na(ant))
top<- B2 %>% filter(!is.na(master))
person<- C1  %>% filter(!is.na(person))
auto <- C2 %>% filter(!is.na(auto))
jump <- C3 %>% filter(!is.na(jump))
X8610 <- C4 %>% filter(!is.na(X8610))

# 각 그룹에 해당하는 acc_id만 담긴  df 생성
normal<-data.frame(normal[,1])
hard<-data.frame(hard[,1])
bottom<-data.frame(bottom[,1])
top<-data.frame(top[,1])
person<-data.frame(person[,1])
auto<-data.frame(auto[,1])
jump<-data.frame(jump[,1])
X8610<-data.frame(X8610[,1])
########################################
# 그룹별 acc_id와 파생변수 추가된 데이터와 join
normal<-inner_join(normal,train)
hard<-inner_join(hard,train)
bottom<-inner_join(bottom,train)
top<-inner_join(top,train)
person<-inner_join(person,train)
auto<-inner_join(auto,train)
jump<-inner_join(jump,train)
X8610<-inner_join(X8610,train)
## 저장
write.csv(normal,"../data/real_last/EDAnormal_1.csv",row.names = F)
write.csv(hard,"../data/real_last/EDAhard_1.csv",row.names = F)
write.csv(bottom,"../data/real_last/EDAant_1.csv",row.names = F)
write.csv(top,"../data/real_last/EDAmaster_1.csv",row.names = F)
write.csv(person,"../data/real_last/EDAperson_1.csv",row.names = F)
write.csv(auto,"../data/real_last/EDAauto_1.csv",row.names = F)
write.csv(jump,"../data/real_last/EDAjump_1.csv",row.names = F)
write.csv(X8610,"../data/real_last/EDAX8610_1.csv",row.names = F)
