CREATE TABLE IF NOT EXISTS `users` (
  `id`         INT(9)      NOT NULL,
  `first_name` TEXT        NOT NULL,
  `last_name`  TEXT        NOT NULL,
  `user_name`  TEXT        NOT NULL,
  `password`   TEXT        NOT NULL,
  `created`    TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email`      TEXT        NOT NULL,
  `salt`       VARCHAR(64) NOT NULL,
  `role`       ENUM(' USER ', ' ADMIN ', 'Manager', 'Employee', 'Unregistered') NOT NULL DEFAULT 'Unregistered'
);


INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created`, `email`, `salt`, `role`)
VALUES
  (5, 'dfg', 'dfgdfg', 'dfg', '$2a$10$UJTc9f2KSIbj2tuM8mYxSehlgBpG7aDFx / Kpwr7TmreTCmfSMoBvK', '2015 - 05 - 04
  08:09:58', 'dfg',
  '$2a$10$UJTc9f2KSIbj2tuM8mYxSe\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
   'Employee'),
  (6, '222', '222', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.Sd99pWb31i5tRVH0AH.sLp8pheUPqwK', '2015 - 05 - 04 09:
  20:58', '222', '$2a$10$EWDAjTi54tq5WTyHLmmUH.', ' ADMIN'),
  (7, 'asd', 'asd', 'asd', '$2a$10$qodIBrrbDy3Of3NmYjK1zeLwiHH7hlHuqXe /.P / U6anVcGxBPHsUq', '2015 - 05 - 04
  13:07:03', 'mushushushu@gmail.com', '$2a$10$qodIBrrbDy3Of3NmYjK1ze', 'Manager'),
  (8, 'er', 'oik', 'oik', '$2a$10$yNTgqYDYle7ABUvSiP6XCeDqJl7D8top6sllZzggnNEjyt.qMAzuC', '2015 - 05 - 04 13:11
  :51', 'mushushushu@gmail.com', '$2a$10$yNTgqYDYle7ABUvSiP6XCe', ' USER '),
  (12, '12', '12', '12', '$2a$10$3cmiNSdH5yHC5qCRvOZ.VeNd3NhbTMhAaZShzmAJy6V0q.cjwaNWu', '2015 - 05 - 05 19:06:
  13', 'david - ep@hotmail.com', '$2a$10$3cmiNSdH5yHC5qCRvOZ.Ve', 'Unregistered'),
  (1234567, 'mombasa', 'mambiso', '1234567', '$2a$10$Gzhi07dcwRLqt3cRkzOzQOCKNLdaWfOLoiRBtc.aZNEO9O / hOefSK',
  '2015 - 05 - 05 19:14:02', 'sagivste@gmail.com', '$2a$10$Gzhi07dcwRLqt3cRkzOzQO', 'Unregistered');


ALTER TABLE `users`
ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);
