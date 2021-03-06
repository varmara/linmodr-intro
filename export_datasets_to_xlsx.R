library(XLConnect)
library(tidyr)

data("Puromycin")
writeWorksheetToFile("data/Puromycin.xlsx", data = Puromycin, sheet = "Puromycin")

library(boot)
data("remission")
writeWorksheetToFile("data/remission.xlsx", data = remission, sheet = "remission")
data("urine")
writeWorksheetToFile("data/urine.xlsx", data = urine, sheet = "urine")
data("catsM")
writeWorksheetToFile("data/catsM.xlsx", data = catsM, sheet = "catsM")
data("calcium")
writeWorksheetToFile("data/calcium.xlsx", data = boot::calcium, sheet = "calcium", clearSheets = T)
data("downs.bc")
writeWorksheetToFile("data/downs.bc.xlsx", data = downs.bc, sheet = "downs.bc")
data("nitrofen")
nitrofen %>% gather(brood, N, -conc, -total) %>%  writeWorksheetToFile("data/nitrofen.xlsx", data = ., sheet = "nitrofen")
data("dogs")
writeWorksheetToFile("data/dogs.xlsx", data = dogs, sheet = "dogs")

library(MASS)
data("Cushings")
writeWorksheetToFile("data/Cushings.xlsx", data = Cushings, sheet = "Cushings")
data("cats")
writeWorksheetToFile("data/cats.xlsx", data = cats, sheet = "cats")
data("leuk")
writeWorksheetToFile("data/leuk.xlsx", data = leuk, sheet = "leuk")
data("GAGurine")
writeWorksheetToFile("data/GAGurine.xlsx", data = GAGurine, sheet = "leuk")

library("robustbase")
data("phosphor")
writeWorksheetToFile("data/phosphor.xlsx", data = phosphor, sheet = "phosphor")
data("toxicity")
writeWorksheetToFile("data/toxicity.xlsx", data = toxicity, sheet = "toxicity")
data("CrohnD")
writeWorksheetToFile("data/CrohnD.xlsx", data = CrohnD, sheet = "CrohnD")

library("lme4")
data("sleepstudy")
writeWorksheetToFile("data/sleepstudy.xlsx", data = sleepstudy, sheet = "sleepstudy")

library("lasso2")
data("Prostate")
writeWorksheetToFile("data/Prostate.xlsx", data = Prostate, sheet = "Prostate")
# прогестерон
# мутации
# goats
# Loyn
# abalone


