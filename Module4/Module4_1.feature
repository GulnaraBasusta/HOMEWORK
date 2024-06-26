﻿#language: ru

@tree

Функционал: заполнения шапки документа Заказ покупателя

Как тестировщик я хочу 
Протестировать заполнения шапки документа Заказ покупателя
чтобы убедиться что поля Партнер, Соглашение, блокировку поля Контрагент в случае если не выбран Партнер

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка заполнения шапки документа Заказ покупателя
	* заполнения шапки документа
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		Когда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'         |
			| '10'  | 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	* Проверка заполнения поля Партнер, Контрагент, Соглашение 	
		Когда элемент формы с именем "Partner" стал равен 'Розничный покупатель'
		Тогда элемент формы с именем "LegalName" стал равен 'Розничный покупатель'
		И элемент формы с именем "Agreement" стал равен 'Розничное'
	* Удаление данных в поле Партнер 
		И в поле с именем 'Partner' я ввожу текст ''
	* Проверка блокировки поля Контрагент в случае если не выбран Партнер 
		Когда элемент формы с именем "Partner" стал равен ''
		Тогда элемент формы с именем "LegalName" не доступен
						