﻿#language: ru

@tree
@screenshot
Функционал: Создание документа Заказ

Как Администратор я хочу 
создать документ Заказ 
чтобы проверить возможности заполнения поля Количество при добавлении Услуги 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка возможности заполнения поля Количество при добавлении Услуги  
	* Открытие формы создания документа 
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		Тогда открылось окно 'Заказы товаров'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
	* Заполнение шапки документа 
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		Тогда открылось окно 'Контрагенты'
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование' |
			| '000000012' | 'Мосхлеб ОАО'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заказ (create) *'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	* Заполнение товарной части 
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
		И в таблице "Товары" я завершаю редактирование строки
		И в таблице "Товары" я добавляю строку
		И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	* Проверка возможности заполнения поля Количество при добавлении Услуги
		И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Доставка'
		И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
		И в таблице "Товары" я завершаю редактирование строки	

