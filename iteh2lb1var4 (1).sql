-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 17 2023 г., 18:24
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `iteh2lb1var4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `nurse`
--

CREATE TABLE `nurse` (
  `id_nurse` int NOT NULL,
  `name` text NOT NULL,
  `date` date NOT NULL,
  `department` int NOT NULL,
  `shift` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `nurse`
--

INSERT INTO `nurse` (`id_nurse`, `name`, `date`, `department`, `shift`) VALUES
(1, 'ivanova', '2021-12-20', 1, 'First'),
(2, 'petrova', '2022-12-20', 2, 'Second'),
(3, 'sidorova', '2023-12-20', 3, 'First'),
(4, 'egorova', '2024-12-20', 4, 'Third'),
(5, 'slaboshanova', '2007-05-20', 3, 'Third'),
(6, 'Obamchenko', '2023-12-25', 1, 'Second');

-- --------------------------------------------------------

--
-- Структура таблицы `nurse_ward`
--

CREATE TABLE `nurse_ward` (
  `fid_nurse` int NOT NULL,
  `fid_ward` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `nurse_ward`
--

INSERT INTO `nurse_ward` (`fid_nurse`, `fid_ward`) VALUES
(1, 1),
(4, 1),
(4, 2),
(3, 2),
(3, 3),
(2, 1),
(5, 4),
(2, 4),
(6, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `ward`
--

CREATE TABLE `ward` (
  `id_ward` int NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `ward`
--

INSERT INTO `ward` (`id_ward`, `name`) VALUES
(1, 'WardFirst'),
(2, 'WardSecond'),
(3, 'WardThird'),
(4, 'WardFourth');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`id_nurse`),
  ADD UNIQUE KEY `id_nurse` (`id_nurse`);

--
-- Индексы таблицы `nurse_ward`
--
ALTER TABLE `nurse_ward`
  ADD KEY `fid_nurse` (`fid_nurse`),
  ADD KEY `fid_ward` (`fid_ward`);

--
-- Индексы таблицы `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`id_ward`),
  ADD UNIQUE KEY `id_ward` (`id_ward`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `nurse_ward`
--
ALTER TABLE `nurse_ward`
  ADD CONSTRAINT `nurse_ward_ibfk_1` FOREIGN KEY (`fid_nurse`) REFERENCES `nurse` (`id_nurse`),
  ADD CONSTRAINT `nurse_ward_ibfk_2` FOREIGN KEY (`fid_ward`) REFERENCES `ward` (`id_ward`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
