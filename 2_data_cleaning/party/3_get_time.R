###각 주차당 동일 작업을 했습니다. 주석은 1주차에 해당하는 부분에만 달려있습니다.


#각 파티가 지속된 시간을 구한다.
rm(list=ls())
setwd("../data")

#1주차 파티데이터 불러오기
party = read.csv('../data/train_party_1wk.csv')
str(party)

#파티시간을 계산하기 위하여 파티가 실제로 지속된 일수를 구한다.
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

#시간을 처리해준다.
party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

#각 파티가 지속된 시간을 분단위로 구한다.
party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
#주 작업에 대해서 필요 없는 부분에 대한 주석처리
#str(party)
#df=data.frame(party$pt)
#names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
#dt=data.frame(party$pt,party$hashed)
#str(dt)
#names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
#str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

#각 파티의 구성원들과 지속된 시간을 저장한다.
dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_1wk_time.csv',row.names = F)







############################### 2

party = read.csv('../data/train_party_2wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_2wk_time.csv',row.names = F)


####################################### 3

party = read.csv('../data/train_party_3wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_3wk_time.csv',row.names = F)

##########################


party = read.csv('../data/train_party_4wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_4wk_time.csv',row.names = F)




#######################
party = read.csv('../data/train_party_5wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_5wk_time.csv',row.names = F)

############################


party = read.csv('../data/train_party_6wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_6wk_time.csv',row.names = F)

######################################


party = read.csv('../data/train_party_7wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_7wk_time.csv',row.names = F)


###############################

party = read.csv('../data/train_party_8wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'train_party_8wk_time.csv',row.names = F)


############################################################################## test 1

party = read.csv('../data/test_party_1wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_1wk_time.csv',row.names = F)

############################################################################## test 2

party = read.csv('../data/test_party_2wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_2wk_time.csv',row.names = F)

############################################################################## test 3

party = read.csv('../data/test_party_3wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_3wk_time.csv',row.names = F)

############################################################################## test 4

party = read.csv('../data/test_party_4wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_4wk_time.csv',row.names = F)

############################################################################## test 5

party = read.csv('../data/test_party_5wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_5wk_time.csv',row.names = F)

############################################################################## test 6

party = read.csv('../data/test_party_6wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_6wk_time.csv',row.names = F)

############################################################################## test 7

party = read.csv('../data/test_party_7wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_7wk_time.csv',row.names = F)

############################################################################## test 8

party = read.csv('../data/test_party_8wk.csv')
str(party)
party$party_end_week=party$party_end_week*7
party$party_start_week=party$party_start_week*7
party$party_end_day=party$party_end_day+party$party_end_week
party$party_start_day=party$party_start_day+party$party_start_week
party$day=party$party_end_day-party$party_start_day
party$day
party=data.frame(party$party_start_time,party$party_end_time,party$day,party$hashed)
names(party)=c('party_start_time','party_end_time','day','hashed')

party$pst=as.character(party$party_start_time)
words=strsplit( party$pst,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pst=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]

party$pet=as.character(party$party_end_time)
words=strsplit(party$pet,':')
words=unlist(words)
words=as.numeric(words)
words[seq(1,length(words),by=3)]=words[seq(1,length(words),by=3)]*3600
words[seq(2,length(words),by=3)]=words[seq(2,length(words),by=3)]*60
party$pet=words[seq(1,length(words),by=3)]+words[seq(2,length(words),by=3)]+words[seq(3,length(words),by=3)]
party$day=party$day*86400
party$pet=party$pet+party$day
party$pt=party$pet-party$pst
str(party)
df=data.frame(party$pt)
names(df)='time'
#write.csv(df,'test_party_time.csv',row.names=F)
dt=data.frame(party$pt,party$hashed)
str(dt)
names(dt)=c('time','hashed')
#write.csv(dt,'party_time.csv',row.names = F)
ptime=round(party$pt/60,digits=1)
ptime=data.frame(ptime)
names(ptime)=c('time')
str(ptime)
#write.csv(ptime,'party_time.csv',row.names = F)

dt=data.frame(ptime$time,party$hashed)
str(dt)
names(dt)=c('time','hashed')
write.csv(dt,'test_party_8wk_time.csv',row.names = F)
