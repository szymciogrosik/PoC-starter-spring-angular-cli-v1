-- insert --
insert into "Role" ("id", "name") values ( 1, 'ROLE_ADMIN');
insert into "Role" ("id", "name") values ( 2, 'ROLE_USER');

insert into "User" ("id", "username", "password", "firstname", "lastname", "email", "accountCreation", "lastModification") values ( 1, 'admin', '$2a$06$35iXNI/T8NSFHPrHry8h.u.UvOKH7IT4EDffNEcp8x1tbLMV/m.lW', 'Andrzej', 'Abacki', 'a.abacki@gmail.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
insert into "User" ("id", "username", "password", "firstname", "lastname", "email", "accountCreation", "lastModification") values ( 2, 'user', '$2a$06$35iXNI/T8NSFHPrHry8h.u.UvOKH7IT4EDffNEcp8x1tbLMV/m.lW', 'Bogdan', 'Babacki', 'b.babackii@gmail.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

insert into "User_Role" ("idUser", "idRole") values ( 1, 1);
insert into "User_Role" ("idUser", "idRole") values ( 1, 2);
insert into "User_Role" ("idUser", "idRole") values ( 2, 2);