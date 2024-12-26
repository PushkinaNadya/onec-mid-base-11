#Область ПрограммныйИнтерфейс 

//++ Пушкина Н,В. доработка 26.12.2024 

Процедура ДополнитьФорму(Форма) Экспорт 
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		ДобавитьПолеСогласованнаяСкидкаВГруппаШапкаЛево(Форма);
		ДобавитьПрограммноКоманду(Форма);
		ДобавитьОбработчикДействия(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);
	КонецЕсли;
	
КонецПроцедуры

//-- Пушкина Н,В. доработка 26.12.2024

#КонецОбласти  

#Область СлужебныйПрограммныйИнтерфейс 

//++ Пушкина Н,В. доработка 26.12.2024 

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма) Экспорт
	
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДК_КонтактноеЛицо";
	
КонецПроцедуры   


Процедура ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма) Экспорт
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Основание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДК_КонтактноеЛицо";
	
КонецПроцедуры    

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма) Экспорт
	
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДК_КонтактноеЛицо";
	
КонецПроцедуры 

Процедура ДобавитьПолеСогласованнаяСкидкаВГруппаШапкаЛево(Форма) Экспорт
	
	ПолеГруппы = Форма.Элементы.Добавить("ГруппаРеквизитИКнопка", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	ПолеГруппы.Вид = ВидГруппыФормы.ОбычнаяГруппа;  
	ПолеГруппы.ОтображатьЗаголовок = Ложь;
	
	ПолеВвода = Форма.Элементы.Добавить("СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаРеквизитИКнопка);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ДК_СогласованнаяСкидка";
	
КонецПроцедуры   

Процедура ДобавитьПрограммноКоманду(Форма) Экспорт
	
	Если Форма.Элементы.Найти("КнопкаПересчитатьТаблицу") = Неопределено Тогда
		//Добавим команду в коллекцию команд
		КомандаПересчитатьТаблицу = Форма.Команды.Добавить("ПересчитатьТаблицу");
		КомандаПересчитатьТаблицу.Заголовок = "Пересчитать таблицу";
		КомандаПересчитатьТаблицу.Действие = "КомандаПересчитатьТаблицу";
		//Добавим команду на форму
		КнопкаКоманды = Форма.Элементы.Добавить("КнопкаПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ГруппаРеквизитИКнопка);
		КнопкаКоманды.ИмяКоманды = "ПересчитатьТаблицу";
		КнопкаКоманды.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КонецЕсли;
	
КонецПроцедуры  

Процедура ДобавитьОбработчикДействия(Форма) Экспорт
	
	Если Форма.Элементы.Найти("СогласованнаяСкидка") = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Форма. Элементы.СогласованнаяСкидка.УстановитьДействие("ПриИзменении", "СогласованнаяСкидкаПриИзменении");
	
КонецПроцедуры


//-- Пушкина Н,В. доработка 26.12.2024

#КонецОбласти 