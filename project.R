happiness<- read.csv("2019.csv")
head(happiness)
summary(happiness)
sum(is.na(happiness))

happiness <- na.omit(happiness)
GDP <- data.frame(x=happiness$GDP.per.capita,
                  y=happiness$Score, Set="GDP vs Score")
GDP
Scoial_Support <- data.frame(x=happiness$Social.support,
                             y=happiness$Score, Set="Social vs Score")
Freedom <- data.frame(x=happiness$Freedom.to.make.life.choices,
                      y=happiness$Score, Set="Freedom vs Score")
Corruption <- data.frame(x=happiness$Perceptions.of.corruption,
                         y=happiness$Score, Set="Corruption vs Score")
healthy<- data.frame(x=happiness$Healthy.life.expectancy,
                     y=happiness$Score, Set="Health vs Score")
Generosity<- data.frame(x=happiness$Generosity,y=
                          happiness$Score, Set="Generosity vs Score")
happy.data <- rbind(GDP,Scoial_Support, Freedom,
                    Corruption,healthy, Generosity)
happy.data
# lm(y~x)
summary(lm(happiness$Score~happiness$GDP.per.capita))
summary(lm(happiness$Score~happiness$Social.support))
summary(lm(happiness$Score~happiness$Freedom.to.make.life.choic
           es))
summary(lm(happiness$Score~happiness$Perceptions.of.corruption)
)
summary(lm(happiness$Score~happiness$Healthy.life.expectancy))
summary(lm(happiness$Score~happiness$Generosity))
library(ggplot2)
dev.new(width=3,height=3)
ggplot(data=happy.data, aes(x=x,y=y))+
  geom_point(size=2,color="red",fill="orange",shape=21)+
  geom_smooth(method="lm", fill=NA, fullrange=F)+
  facet_wrap(~Set, ncol=2)+
  ylab("Happiness Score")+
  xlab("Corruption,Freedom, GDP, Social Support, Health,
Generosity")
-------------------------------------------------------------
  happyover6<- happiness[happiness$Score>6,]
happyover6
happyunder4<- happiness[happiness$Score<4,]
happyunder4
happyoverfive<-happiness[happiness$Score>5,]
happyoverfive$Overall.rank #97
happyunderfive<-happiness[happiness$Score<5,]
happyunderfive$Overall.rank #59
ggplot(happyover6, aes(x=Score,y=Country.or.region))+
  geom_col(color=1,position="dodge", fill="lavender")+
  xlab("Happiness
Score")+ylab("Countries")+theme(legend.position="none")+
  theme(axis.title.y=element_text(size=11,face="bold",angle=0))+
  theme(axis.title.x=element_text(size=11,face="bold"))
ggplot(happyunder4, aes(x=Score,y=Country.or.region))+
  geom_col(color=1,position="dodge", fill="lavender")+
  xlab("Happiness
Score")+ylab("Countries")+theme(legend.position="none")+
  theme(axis.title.y=element_text(size=11,face="bold",angle=0))+
  theme(axis.title.x=element_text(size=11,face="bold"))
