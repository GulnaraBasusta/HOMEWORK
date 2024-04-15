﻿#language: ru

@tree

Функционал: проверка на заполнение поля Организация в документе Заказ покупателя

Как тестировщик я хочу 
протестипрвать документа Заказ покупателя на заполнение поля Организация
чтобы в случае если поле Организация не заполнилось из соглашения, заполнить его из соглашения

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка на заполнение поля Организация
	* Заполнение шапки документа Заказ покупателя
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '1'   | 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	* проверка поле Организация, в случае если не заполнилось заполнить из соглашения
		Если элемент формы с именем "Company" не имеет значение тогда
			И я нажимаю на кнопку открытия поля с именем "Agreement"
			И я нажимаю кнопку выбора у поля с именем "Company"
			Тогда открылось окно 'Организации'
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я выбираю текущую строку
			И я нажимаю на кнопку с именем 'FormWriteAndClose'
			И я жду закрытия окна 'Розничный клиент * (Соглашение) *' в течение 20 секунд
			И я нажимаю кнопку выбора у поля с именем "Agreement"
			Тогда открылось окно 'Соглашения'
			И в таблице "List" я активизирую поле с именем "Description"
			И в таблице "List" я выбираю текущую строку
			Когда открылось окно 'Табличная часть товаров будет обновлена'
			И я нажимаю на кнопку с именем 'FormOK'