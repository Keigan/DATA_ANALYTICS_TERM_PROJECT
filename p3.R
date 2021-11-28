crash <- new_crash_dataset

mean(crash$crew_inj_level, na.rm = TRUE)
sd(crash$crew_inj_level, na.rm = TRUE)

mean(crash$crew_age, na.rm = TRUE)
sd(crash$crew_age, na.rm = TRUE)

mean(crash$flight_hours, na.rm = TRUE)
sd(crash$flight_hours, na.rm = TRUE)

crash_mlr <- lm(crew_inj_level~ crew_age * flight_hours, data = crash)
summary(crash_mlr)

par(mfrow = c(2, 2))
plot(crash_mlr)
library(ggfortify)
autoplot(crash_mlr)

install.packages("interactions")
library(interactions)
interact_plot(crash_mlr, pred = flight_hours, modx = crew_age, plot.points=TRUE)

