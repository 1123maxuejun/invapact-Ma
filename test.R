range(Spring$Time)
timeRad<-Spring$Time*2*pi
#提取1区的雌性马鹿数据来绘制核密度曲线
SH<-timeRad[Spring$Zone==1&Spring$Gender=='SH']
densityPlot(SH,rug=TRUE)
CSG<-timeRad[Spring$Zone==1&Spring$Gender=='CSG']
densityPlot(CSG,rug=TRUE)