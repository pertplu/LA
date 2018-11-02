library(readODS)
library(zoo)

df <- read_ods('/home/john/Documents/LA/to_import.ods')
names(df) <- c('lect', 'topic', 'probs')
setDT(df)

df[, probs := na.fill(probs, '')]


full <- (as.Date('2019-03-01') - today())
lecs <- (full - 14)/26
cal <- today() + cumsum(rep(lecs, 26))
df[, fin_dt := c(cal, as.Date('2019-03-01'))]

write_rds(df, '/home/john/Documents/LA/cal.rds')

cal <- read_rds('/home/john/Documents/LA/cal.rds')
cal
