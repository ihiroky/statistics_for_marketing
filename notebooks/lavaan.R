.libPaths('./rlib')
library(lavaan)
library(semPlot)

rel <- cor(dat)

model <- ('
# 測定方程式
f1 =~ x1 + x2 + x3 + x4
f2 =~ x5 + x6
f3 =~ x7 + x8
f4 =~ y1 + y2
# 構造方程式
f4 ~ f1 + f2 + f3
')

fit <- sem(model, sample.cov=rel, sample.nobs=85)
png('./sem.png')
semPaths(fit, 'std', edge.label.cex=1, rotation=2, curvePivot=TRUE,
    sizeMan=8, sizeInt=1, sizeLat=8)
dev.off()
