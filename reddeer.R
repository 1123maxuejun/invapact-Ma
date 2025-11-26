#1天山马鹿春季雌、雄核密度曲线
install.packages("overlap")
library("overlap")
setwd("E://renewal")
Spring<- read.table("file://E://renewal//分季节检验//LL.txt",header = TRUE)
View(Spring)
head(Spring)
table(Spring$Zone)

range(Spring$Time)
timeRad<-Spring$Time*2*pi
#提取1区的雌性马鹿数据来绘制核密度曲线
SH<-timeRad[Spring$Zone==1&Spring$Gender=='SH']
densityPlot(SH,rug=TRUE)
CSG<-timeRad[Spring$Zone==1&Spring$Gender=='CSG']
densityPlot(CSG,rug=TRUE)
##量化重叠-重叠系数-我们将提取第1区马鹿雌性和雄性的数据，计算重叠并绘制曲线
SH<-timeRad[Spring$Zone==1&Spring$Gender=='SH']
CSG<-timeRad[Spring$Zone==1&Spring$Gender=='CSG']
min(length(SH),length(CSG))
tigmac2est<-overlapEst(SH,CSG,type = "Dhat4")
tigmac2est
overlapPlot(SH,CSG,main="")

legend('topright',c("沙虎 SH","刺山柑 CSG"),lty = c(1,2),col=c(1,4),bty='n')#图例
##置信区间
tigmac2<-bootstrap(SH,CSG,1000,type="Dhat4")#引导平均值
(BSmean<-mean(tigmac2))
##提取CI-需要perc这一行
bootCI(tigmac2est,tigmac2)
bootCIlogit(tigmac2est,tigmac2)
