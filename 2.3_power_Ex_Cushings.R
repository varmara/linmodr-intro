#### Упражнение по анализу мощности ####
#
# Экскреция метаболитов и синдром Кушинга
#
# Синдромом Кушинга называется группа заболеваний по разным
# причинам вызывающих чрезмерную выработку гормонов
# надпочечников. В датасете `Cushings` содержатся данные по
# выведению с мочой двух метаболитов стероидных гормонову
# пациентов с разными типами заболевания (Aitchison,
# Dunsmore 1975).
#
# Переменные:
# - Tetrahydrocortisone - тетрагидрокортизон
# - Pregnanetriol - прегнантриола
# - Type - тип синдрома Кушинга
#        - a - аденома
#        - b - двусторонняя гиперплазия
#        - c - карцинома
#        - u - неизвестно

#### Загрузка пакетов из библиотеки ####

library(readxl)
library(ggplot2)
library(pwr)
library(effsize)

#### Знакомство с данными ####

# Не забудьте установить рабочую директорию или
# отредактируйте путь к файлу данных

# Открываем данные
Cushings <- read_excel("data/Cushings.xlsx", sheet = 1)
head(Cushings)

str(Cushings)
# Переменная тип сейчас не фактор - сделаем ее фактором
Cushings$Type <- factor(Cushings$Type)

names(Cushings)
# Имена переменных слишком длинные - переименуем
names(Cushings) <- c("Tetr", "Pregn", "Type")

# Есть ли пропущенные значения?
colSums(is.na(Cushings))

# Сколько было пациентов с каждым из типов синдрома?
table(Cushings$Type)

# Есть ли выбросы? Построим дот-плот
gg_dot <- ggplot(Cushings, aes(y = 1:nrow(Cushings))) + geom_point()
gg_dot + aes(x = Tetr)
gg_dot + aes(x = Pregn)
# Один человек с очень большой секрецией тетрагидрокортизона
# Один человек с необычно большой секрецией прегнатриола

ggplot(Cushings, aes(x = Type, y = Tetr)) + geom_boxplot()
ggplot(Cushings, aes(x = Type, y = Pregn)) + geom_boxplot()
# Те же люди Один человек с очень большой секрецией
# тетрагидрокортизона - с карциномой. Но там бывают большие
# значения Один человек с необычно большой секрецией
# прегнатриола - с аденомой, и для этого типа синдрома
# нехарактерны большие значения Можно попробовать удалить
# второе наблюдение

f_outlier <- Cushings$Pregn > 10
# обратите внимание, ! - это логическое отрицание

Cushings_2 <- Cushings[!f_outlier, ]
# Вот с этим датасетом мы и будем работать дальше

#### Задание 1 ---------------------------------------------

# Давайте представим, что в датасете Cushings_2 лежат данные
# пилотного исследования.
# При помощи средств пакета pwr оцените какой объем выборки
# понадобится, чтобы показать, что уровень экскреции
# тетрагидрокортизона достоверно различается у пациентов с
# аденомой и билатеральной гиперплазией надпочечников.

#### Задание 2 ---------------------------------------------

# Используя данные пилотного исследования, при помощи
# симуляций оцените, как меняется мощность t-теста для
# сравнения пациентов с аденомой и билатеральной
# гиперплазией надпочечников в зависимости от объема
# выборки.
# Постройте график изменения мощности теста
