# Как работать с кодом этого сайта

Дорогие коллабораторы, этот сайт построен с помощью RMarkdown. Подробнее можно прочитать здесь http://rmarkdown.rstudio.com/rmarkdown_websites.html

Презентации сделаны в формате ioslides.

Удобнее всего работать с проектом RStudio __glmintro.Rproj__

## git pull

Нас много, поэтому перед началом работы --- __git pull__

После того, как поработали (сделали несколько локальных коммитов) --- __git pull__

И только потом уже (возможно, после разрешения конфликтов слияния) --- __git push__

## Особенности форматирования презентаций.

__Старайтесь давать имена чанкам с графиками__. После этого в директории `ваша_презентация_files` не будут появляться лишние дубли графиков при изменени порядка чанков.

__Не нужно без крайней необходимости уменьшать текст при помощи__ `.smaller`. Шрифты итак очень мелкие --- будет не видно, если экран в аудитории небольшой. Если что-то не помещается, лучше разбить на несколько слайдов.

__При двухколоночной верстке избегайте формул в колонках__, т.к. в браузере Chrome пропадает большинство элементов. Формулы можно помещать до начала двухколоночного `<div class="columns-2"><\div>`

__При двухколоночной верстке размещайте иллюстрации слева__, иначе в браузере Chrome не происходит разделения на две колонки.

## Обновление ioslides презентации --- из командной строки

Если кодировка файла совпадает с кодировкой системы

```
rmarkdown::render("02_filename.Rmd", output_format = "ioslides_presentation")
```

Если кодировка исходного файла другая --- указываем правильную
```
rmarkdown::render("02_filename.Rmd", output_format = "ioslides_presentation", encoding = "Windows-1251")

# или

rmarkdown::render("02_filename.Rmd", output_format = "ioslides_presentation", encoding = "Utf-8")
```

## Генерация кода для студентов из Rmd--- из командной строки

- Отметьте ненужные студентам чанки опцией `purl=FALSE`
- Экстрагируйте код из файла. Весь обычный текст будет закомментирован. ВНИМАНИЕ: пока нам не лень, код помечаем словом `code` после номера занятия: у многих студентов скрыты расширения файлов.

```
purl("02_filename.Rmd", documentation = 2, output = "02_code_filename.R")
```
- Удалите вручную ненужный текст, решения задач. Оставьте только необходимые заголовки.
- Проверьте,  есть ли ссылка на файл с кодом в файле `lectures.Rmd`.
- Закомитьте (и запушьте, если надо) изменения


## Обновление простой html-страницы --- из командной строки

```
rmarkdown::render_site("filename.Rmd")
```
Если кодировка исходного файла не совпадает с кодировкой системы --- указываем его правильную кодировку

```
rmarkdown::render_site("filename.Rmd", encoding = "Windows-1251")

# или

rmarkdown::render_site("filename.Rmd", encoding = "Utf-8")
```

## Обновление сайта целиком

  - через интерфейс RStudio --- на вкладке _Build_
  - из командной строки `rmarkdown::render_site()`

__Осторожно!__ Это может не сработать, т.к. у нас есть файлы в разных кодировках. Лучше обновлять постранично.

## Публикация сайта

Сайт располагается на github pages. Чтобы изменения появились на сайте, достаточно запушить свои коммиты в бренч master

```
git push origin master
```
