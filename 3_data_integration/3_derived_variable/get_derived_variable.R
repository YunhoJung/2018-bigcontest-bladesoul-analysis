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
train<-read.csv('train_merge_0911.csv')
test<-read.csv('test_merge_0911.csv')
colnames(train)

# 합치기
new <- rbind(train,test)
# 변수생성
colnames(new)
# X1 :  game_combat_time/play_time
new$X1<-(new$game_combat_time/new$play_time)
# X2 : sum of npc_exp
new$X2 <-new$npc_exp+new$npc_hongmun
# X3 : sum of quest exp
new$X3 <-new$quest_exp+new$quest_hongmun
# X4 : sum of all exp
new$X4 <-new$X2+new$X3+new$item_hongmun
# X5 : all exp / play_time
new$X5<-new$X4/new$play_time
# X6 : get_money/play_time
new$X6<-new$get_money/new$play_time
# X7 : all enter inzone count
new$X7 <-new$cnt_enter_inzone_solo+new$cnt_enter_inzone_normal+new$cnt_enter_inzone_skilled+new$cnt_enter_inzone_solo
# X8 : all enter raid count
new$X8 <-new$cnt_enter_raid+new$cnt_enter_raid_light
# X9 : all enter inzone & raid
new$X9 <- new$X7+new$X8
# X10 : all clear inzone count
new$X10 <-new$cnt_clear_inzone_light+new$cnt_clear_inzone_normal+new$cnt_clear_inzone_skilled+new$cnt_clear_inzone_solo
# X11: all clear raid count
new$X11 <-new$cnt_clear_raid+new$cnt_enter_raid_light
# X12 : all clear inzone& raid count
new$X12<-new$X10+new$X11
# X13 : sum of chat
new$X13 <- new$normal_chat+new$guild_chat+new$whisper_chat+new$district_chat+new$party_chat+new$faction_chat
# X14 : sum of chat / play_time
new$X14 <- new$X13/new$play_time
# X15 : normal_chat / all chat
new$X15<-new$normal_chat/new$X13
# X16 : guild_chat / all chat
new$X16 <- new$guild_chat/new$X13
#X17 : party_chat/all chat
new$X17 <- new$party_chat/new$X13
#X18 : whisper_chat / all chat
new$X18 <- new$whisper_chat/new$X13
#X19 : dist_chat / all chat
new$X19 <- new$district_chat/new$X13
# X20 : party_time per play_time
new$X20 <- new$party_time/new$play_time
# X21 : amount of money flow
new$X21 <- new$rec_money - new$give_money
# X22 : amount of grocery flow
new$X22 <- new$rec_grocery - new$give_grocery
# X23 : amount of money trade
new$X23 <- new$rec_money + new$give_money
# X24 : amount of grocery trade
new$X24 <- new$rec_grocery + new$give_grocery
# X25 : amount of money trade per play time
new$X25 <- new$X23/ new$play_time
# X26: amount of grocery trade per play time
new$X26 <- new$X24 / new$play_time
# X27 : sum of gathering,making
new$X27 <- new$gathering_cnt+new$making_cnt
# X28 : sum of hongmun
new$X28 <-new$npc_hongmun+new$quest_hongmun+new$item_hongmun

# 재분할
train<-new[1:440323,]
test<-new[440324:615954,]
# 저장
write.csv(train,"../data/real_last/train_chad.csv",na="0",row.names = F)
write.csv(test,"../data/real_last/test_chad.csv",na="0",row.names = F)
