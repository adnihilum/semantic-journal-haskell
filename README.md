# semantic-journal
# Проект semantic-journal
## Сущности
- Статья
  - Тайтл
  - Дата создания
  - Дата изменнения
  - Список тегов

- Тег
  - Имя
  - Список тегов

- Поиск
    - Запрос: Список тегов через запятую
    - Результат
        - Список статей которые роднятся с тегами (через граф метатегов)
        - Список тегов (которыми помечаны)
    
- Поиск статей
    - Список тегов через запятую
## База данных
## Стадии разработки
1. Локальное приложение 
2. докеризированое приложение с возможностью развёртки через кубернетес (Это уже в дром репе)
3. ~~сервис типа lifejournal~~

# Поток сознания на тему концепции проекта
Улучшенный дневник. Дневник в котором записи связаны не только хронологическим образом. Но и с помощью тегов. А также можно отвечать на другие статьи (получается диалог сам с самим собой). А так же есть возможность группировать статьи в группы с помощью тегов. Теги в свою очередь тоже можно помечать метатегами. Метатеги можно помечать метатегами. Можно селектить стать с помощью метатега.

## Какие юзкейсы?
1. Иногда хочется ответить на свою статью в дневнике. Потому что, например, какая-то ситуация развилась и появились новые данные.
2. Возникает нужда помечать теги метатегами, например есть набор мыслей о проектах. Эти мысли (описанные в статьях) помечены тегами- названиями проектов. И тут нужен список проектов. Для этого мы помечаем проекты метатегами - "проект", "опенсорс". Также интересно будет возможность делать богатый поисковый запрос, например "проекты", "идея".

## Терминология
Метатег - тег которым помечен хотябы один другой тег


## Зачем?
Прост)