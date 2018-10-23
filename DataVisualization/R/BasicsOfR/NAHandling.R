library(dplyr)
dmyoung <- dm %>% filter(Age == "Young")
summ_NA <- summary(dmyoung$History)
dmyoung_noNA <- dmyoung[!is.na(dmyoung$History),]
summ_noNA <- summary(dmyoung_noNA$History)
dmyoung_NA <- dmyoung[is.na(dmyoung$History),]
hi_rat <- summ_noNA[1]/nrow(dmyoung_noNA)
mid_rat <- summ_noNA[3]/nrow(dmyoung_noNA)
low_rat <- summ_noNA[2]/nrow(dmyoung_noNA)
random_rows <- sample(nrow(dmyoung_NA))
hi_row_count <- round(nrow(dmyoung_NA)*hi_rat)
mid_row_count <- round(nrow(dmyoung_NA)*mid_rat)
low_row_count <- round(nrow(dmyoung_NA)*low_rat)
hi_rows <- random_rows[1:hi_row_count]
mid_rows <- random_rows[(hi_row_count+1):(hi_row_count+mid_row_count)]
low_rows <- random_rows[(hi_row_count+mid_row_count+1):length(random_rows)]
dmyoung_NA$HistImput <- dmyoung_NA$History
dmyoung_NA$HistImput[hi_rows] <- "High"
dmyoung_NA$HistImput[mid_rows] <- "Medium"
dmyoung_NA$HistImput[low_rows] <- "Low"
summary(dmyoung_NA$HistImput)
dmyoung_noNA$HistImput <- dmyoung_noNA$History
dmyoung2 <- rbind(dmyoung_NA,dmyoung_noNA)
summary(dmyoung2$HistImput)
dmnoyoung <- dm %>% filter(Age != "Young")
dmnoyoung$HistImput <- dmnoyoung$History
dm2 <- rbind(dmnoyoung, dmyoung2)
