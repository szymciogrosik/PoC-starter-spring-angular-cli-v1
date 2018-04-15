drop table if exists "Role", "User", "User_Role";

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table if not exists "Role" (
   "id"              INT4                 not null,
   "name"                VARCHAR(50)          not null,
   constraint PK_ROLE primary key ("id")
);

/*==============================================================*/
/* Index: Role_PK                                               */
/*==============================================================*/
create unique index if not exists Role_PK on "Role" (
   "id"
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table if not exists "User" (
   "id"                   INT4                 not null,
   "username"             VARCHAR(50)          not null,
   "password"             VARCHAR(500)         not null,
   "firstname"            VARCHAR(100)         not null,
   "lastname"             VARCHAR(100)         not null,
   "email"                VARCHAR(50)          not null,
   "accountCreation"      TIMESTAMP     		   not null,
   "lastModification"     TIMESTAMP     		   not null,
   constraint PK_USER primary key ("id")
);

/*==============================================================*/
/* Index: User_PK                                               */
/*==============================================================*/
create unique index if not exists User_PK on "User" (
   "id"
);

/*==============================================================*/
/* Table: User_Role                                             */
/*==============================================================*/
create table if not exists "User_Role" (
   "idUser"               INT4                 not null,
   "idRole"              INT4                 not null,
   constraint PK_USER_ROLE primary key ("idUser", "idRole")
);

/*==============================================================*/
/* Index: User_Role_PK                                          */
/*==============================================================*/
create unique index if not exists User_Role_PK on "User_Role" (
   "idUser",
   "idRole"
);

/*==============================================================*/
/* Index: User_Role_FK                                          */
/*==============================================================*/
create index if not exists User_Role_FK on "User_Role" (
   "idUser"
);

/*==============================================================*/
/* Index: User_Role2_FK                                         */
/*==============================================================*/
create index if not exists User_Role2_FK on "User_Role" (
   "idRole"
);

alter table "User_Role"
   add constraint FK_USER_ROL_USER_ROLE_USER foreign key ("idUser")
references "User" ("id")
on delete restrict on update restrict;

alter table "User_Role"
   add constraint FK_USER_ROL_USER_ROLE_ROLE foreign key ("idRole")
references "Role" ("id")
on delete restrict on update restrict;



-- insert --
insert into "Role" values ( 1, 'ROLE_ADMIN');
insert into "Role" values ( 2, 'ROLE_USER');

insert into "User" ("id", "username", "password", "firstname", "lastname", "email", "accountCreation", "lastModification") values ( 1, 'admin', '$2a$06$35iXNI/T8NSFHPrHry8h.u.UvOKH7IT4EDffNEcp8x1tbLMV/m.lW', 'Andrzej', 'Abacki', 'a.abacki@gmail.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());
insert into "User" ("id", "username", "password", "firstname", "lastname", "email", "accountCreation", "lastModification") values ( 2, 'user', '$2a$06$35iXNI/T8NSFHPrHry8h.u.UvOKH7IT4EDffNEcp8x1tbLMV/m.lW', 'Bogdan', 'Babacki', 'b.babackii@gmail.com', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

insert into "User_Role"values ( 1, 1);
insert into "User_Role"values ( 1, 2);
insert into "User_Role"values ( 2, 2);