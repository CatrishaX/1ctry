﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2021, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

#Область ДляВызоваИзДругихПодсистем

// СтандартныеПодсистемы.БизнесПроцессыИЗадачи

// Получить структуру с описанием формы выполнения задачи.
// Вызывается при открытии формы выполнения задачи.
//
// Параметры:
//   ЗадачаСсылка  - ЗадачаСсылка.ЗадачаИсполнителя - задача.
//   ТочкаМаршрутаБизнесПроцесса - ТочкаМаршрутаБизнесПроцессаСсылка - точка маршрута.
//
// Возвращаемое значение:
//   Структура   - структуру с описанием формы выполнения задачи.
//                 Ключ "ИмяФормы" содержит имя формы, передаваемое в метод контекста ОткрытьФорму(). 
//                 Ключ "ПараметрыФормы" содержит параметры формы. 
//
Функция ФормаВыполненияЗадачи(ЗадачаСсылка, ТочкаМаршрутаБизнесПроцесса) Экспорт
	// Бизнес-процесс не имеет прикладных форм выполнения поручений.
	Возврат Новый Структура;
	
КонецФункции

// Вызывается при перенаправлении задачи.
//
// Параметры:
//   ЗадачаСсылка  - ЗадачаСсылка.ЗадачаИсполнителя - задача.
//   НоваяЗадачаСсылка  - ЗадачаСсылка.ЗадачаИсполнителя - задача для нового исполнителя.
//
Процедура ПриПеренаправленииЗадачи(ЗадачаСсылка, НоваяЗадачаСсылка) Экспорт
	
КонецПроцедуры

// Вызывается при выполнении задачи из формы списка.
//
// Параметры:
//   ЗадачаСсылка - ЗадачаСсылка.ЗадачаИсполнителя - задача.
//   БизнесПроцессСсылка - ЛюбаяСсылка - ссылка на бизнес процесс.
//   ТочкаМаршрутаБизнесПроцесса - ЛюбаяСсылка - точка маршрута.
//
Процедура ОбработкаВыполненияПоУмолчанию(ЗадачаСсылка, БизнесПроцессСсылка, ТочкаМаршрутаБизнесПроцесса) Экспорт

КонецПроцедуры

// Вызывается для заполнения реквизита ГлавнаяЗадача из данных заполнения.
//
// Параметры:
//  БизнесПроцессОбъект  - БизнесПроцессОбъект - бизнес-процесс.
//  ДанныеЗаполнения     - Произвольный        - данные заполнения, которые передаются в обработчик заполнения.
//  СтандартнаяОбработка - Булево              - если установить Ложь, то стандартная обработка заполнения не будет
//                                               выполнена.
//
Процедура ПриЗаполненииГлавнойЗадачиБизнесПроцесса(БизнесПроцессОбъект, ДанныеЗаполнения, СтандартнаяОбработка) Экспорт
	
КонецПроцедуры

// Конец СтандартныеПодсистемы.БизнесПроцессыИЗадачи

// СтандартныеПодсистемы.ГрупповоеИзменениеОбъектов

// Возвращает реквизиты объекта, которые разрешается редактировать
// с помощью обработки группового изменения реквизитов.
//
// Возвращаемое значение:
//  Массив из Строка
//
Функция РеквизитыРедактируемыеВГрупповойОбработке() Экспорт
	
	Результат = Новый Массив;
	Результат.Добавить("Автор");
	Результат.Добавить("Исполнитель");
	Результат.Добавить("ПроверитьВыполнение");
	Результат.Добавить("Проверяющий");
	Результат.Добавить("СрокИсполнения");
	Результат.Добавить("СрокПроверки");
	
	Возврат Результат;
	
КонецФункции

// Конец СтандартныеПодсистемы.ГрупповоеИзменениеОбъектов

// СтандартныеПодсистемы.ВерсионированиеОбъектов

// Определяет настройки объекта для подсистемы ВерсионированиеОбъектов.
//
// Параметры:
//  Настройки - Структура - настройки подсистемы.
//
Процедура ПриОпределенииНастроекВерсионированияОбъектов(Настройки) Экспорт

КонецПроцедуры

// Конец СтандартныеПодсистемы.ВерсионированиеОбъектов

// СтандартныеПодсистемы.УправлениеДоступом

// Параметры:
//   Ограничение - см. УправлениеДоступомПереопределяемый.ПриЗаполненииОграниченияДоступа.Ограничение
//
Процедура ПриЗаполненииОграниченияДоступа(Ограничение) Экспорт
	
	// Предмет:
	//   ДокументСсылка._ДемоСчетНаОплатуПокупателю,
	//   ДокументСсылка._ДемоЗаказПокупателя,
	//   СправочникСсылка.Файлы,
	//   СправочникСсылка.Пользователи.
	
	Ограничение.Текст =
	"ПрисоединитьДополнительныеТаблицы
	|ЭтотСписок КАК _ДемоЗаданиеСРолевойАдресацией
	|
	|ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ИсполнителиЗадач КАК ИсполнителиЗадач
	|ПО
	|	ИсполнителиЗадач.РольИсполнителя = _ДемоЗаданиеСРолевойАдресацией.РольИсполнителя
	|	И ИсполнителиЗадач.ОсновнойОбъектАдресации = _ДемоЗаданиеСРолевойАдресацией.ОсновнойОбъектАдресации
	|	И ИсполнителиЗадач.ДополнительныйОбъектАдресации = _ДемоЗаданиеСРолевойАдресацией.ДополнительныйОбъектАдресации
	|
	|ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.ИсполнителиЗадач КАК ПроверяющиеЗадач
	|ПО
	|	ПроверяющиеЗадач.РольИсполнителя = _ДемоЗаданиеСРолевойАдресацией.РольПроверяющего
	|	И ПроверяющиеЗадач.ОсновнойОбъектАдресации = _ДемоЗаданиеСРолевойАдресацией.ОсновнойОбъектАдресацииПроверяющий
	|	И ПроверяющиеЗадач.ДополнительныйОбъектАдресации = _ДемоЗаданиеСРолевойАдресацией.ДополнительныйОбъектАдресацииПроверяющий
	|;
	|РазрешитьЧтение
	|ГДЕ
	|	ЗначениеРазрешено(Автор)
	|	ИЛИ ЗначениеРазрешено(Исполнитель)
	|	ИЛИ ЗначениеРазрешено(Проверяющий)
	|	ИЛИ (    ЗначениеРазрешено(ИсполнителиЗадач.Исполнитель)
	|	     ИЛИ ЗначениеРазрешено(ПроверяющиеЗадач.Исполнитель) )
	|	  И (    ЗначениеРазрешено(Предмет ТОЛЬКО Справочник.Пользователи)
	|	     ИЛИ ЧтениеОбъектаРазрешено(Предмет КРОМЕ (Справочник.Пользователи, Справочник.Файлы))
	|	     ИЛИ ЧтениеОбъектаРазрешено(ВЫРАЗИТЬ(Предмет КАК Справочник.Файлы).ВладелецФайла КРОМЕ БизнесПроцесс._ДемоЗаданиеСРолевойАдресацией))
	|;
	|РазрешитьИзменениеЕслиРазрешеноЧтение
	|ГДЕ
	|	ЗначениеРазрешено(Автор)";
	
	Ограничение.ТекстДляВнешнихПользователей =
	"РазрешитьЧтениеИзменение
	|ГДЕ
	|	ЗначениеРазрешено(Исполнитель)
	|	ИЛИ ЗначениеРазрешено(Автор)";
	
КонецПроцедуры

// Конец СтандартныеПодсистемы.УправлениеДоступом

// СтандартныеПодсистемы.ПодключаемыеКоманды

// Определяет список команд создания на основании.
//
// Параметры:
//  КомандыСозданияНаОсновании - см. СозданиеНаОснованииПереопределяемый.ПередДобавлениемКомандСозданияНаОсновании.КомандыСозданияНаОсновании
//  Параметры - см. СозданиеНаОснованииПереопределяемый.ПередДобавлениемКомандСозданияНаОсновании.Параметры
//
Процедура ДобавитьКомандыСозданияНаОсновании(КомандыСозданияНаОсновании, Параметры) Экспорт
	
КонецПроцедуры

// Для использования в процедуре ДобавитьКомандыСозданияНаОсновании других модулей менеджеров объектов.
// Добавляет в список команд создания на основании этот объект.
//
// Параметры:
//  КомандыСозданияНаОсновании - см. СозданиеНаОснованииПереопределяемый.ПередДобавлениемКомандСозданияНаОсновании.КомандыСозданияНаОсновании
//
// Возвращаемое значение:
//  СтрокаТаблицыЗначений, Неопределено - описание добавленной команды.
//
Функция ДобавитьКомандуСоздатьНаОсновании(КомандыСозданияНаОсновании) Экспорт
	
	Возврат СозданиеНаОсновании.ДобавитьКомандуСозданияНаОсновании(КомандыСозданияНаОсновании, Метаданные.БизнесПроцессы._ДемоЗаданиеСРолевойАдресацией);
	
КонецФункции

// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти

#КонецЕсли