drop table if exists Achat;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Fournisseur;

drop table if exists RoleUtilisateur;

drop table if exists Utilisateur;

drop table if exists Vente;

/*==============================================================*/
/* Table : Achat                                                */
/*==============================================================*/
create table Achat
(
   idAchat              int not null,
   idFsseur             int not null,
   idUtilisateur        int not null,
   idArt                int not null,
   date                 datetime,
   quantite             float,
   prixUnitaire         float,
   prixTotal            float,
   primary key (idAchat),
   key AK_Identifiant_1 (prixTotal),
   key AK_Identifiant_2 (idAchat)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   idArt                int not null,
   idCat                int not null,
   libelle              varchar(254),
   description          varchar(254),
   prixUnitaire         float,
   quantite             float,
   primary key (idArt)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   idCat                int not null,
   nom                  varchar(254),
   primary key (idCat)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   idClient             int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (idClient)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   idFsseur             int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   adresse              varchar(254),
   telephone            int,
   email                varchar(254),
   primary key (idFsseur)
);

/*==============================================================*/
/* Table : RoleUtilisateur                                      */
/*==============================================================*/
create table RoleUtilisateur
(
   idRole               int not null,
   poste                varchar(254),
   primary key (idRole)
);

/*==============================================================*/
/* Table : Utilisateur                                          */
/*==============================================================*/
create table Utilisateur
(
   idUtilisateur        int not null,
   idRole               int,
   nom                  varchar(254),
   email                varchar(254),
   motDePasse           varchar(254),
   primary key (idUtilisateur)
);

/*==============================================================*/
/* Table : Vente                                                */
/*==============================================================*/
create table Vente
(
   idVente              int not null,
   idArt                int not null,
   idUtilisateur        int not null,
   idClient             int not null,
   date                 datetime,
   quantite             float,
   prixUnitaire         float,
   prixTotal            float,
   primary key (idVente)
);

alter table Achat add constraint FK_association4 foreign key (idFsseur)
      references Fournisseur (idFsseur) on delete restrict on update restrict;

alter table Achat add constraint FK_association8 foreign key (idUtilisateur)
      references Utilisateur (idUtilisateur) on delete restrict on update restrict;

alter table Achat add constraint FK_association9 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

alter table Article add constraint FK_association1 foreign key (idCat)
      references Categorie (idCat) on delete restrict on update restrict;

alter table Utilisateur add constraint FK_association2 foreign key (idRole)
      references RoleUtilisateur (idRole) on delete restrict on update restrict;

alter table Vente add constraint FK_association5 foreign key (idArt)
      references Article (idArt) on delete restrict on update restrict;

alter table Vente add constraint FK_association6 foreign key (idUtilisateur)
      references Utilisateur (idUtilisateur) on delete restrict on update restrict;

alter table Vente add constraint FK_association7 foreign key (idClient)
      references Client (idClient) on delete restrict on update restrict;

INSERT INTO Categorie (idCat, nom)
VALUES 
(1,'hp'),
(2,'dell'),
(3,'toshiba'),
(4,'ipad'),
(5,'lenova');

INSERT INTO Article (idArt, idCat, libelle, description, prixUnitaire, quantite)
VALUES 
(11,1,'Ordinateur','hp',500000,10),
(12,2,'ordinateur','dell',300000,15),
(13,3,'ordinateur','toshiba',350000,25),
(14,4,'ordinateur','ipad',1500000,30),
(15,5,'ordinateur','lenova',350000,35);

INSERT INTO Client (idClient, nom, prenom, adresse, telephone, email)
VALUES 
(241,'KAGABO','Jean','01 BP 1258',65021242,'kagajeanl@gmail.com'),
(242,'KAZUNGU','Etienne','01 BP 3470',67892328,'kazunguet@gmail.com'),
(243,'RUKARA','Jacques','01 BP 4758',77021327,'rukarajacques@gmail.com'),
(244,'CYIZA','Emmanuel','01 BP 1288',66475210,'cyizamanu@gmail.com'),
(245,'KIBAMBA','Damien','01 BP 1977',55789425,'kibambadami@gmail.com');

INSERT INTO Fournisseur (idFsseur, nom, prenom, adresse, telephone, email)
VALUES 
(71,'BIRYABARAME','Paul','01 BP 2458',70874510,'biryabaramep@gmail.com'),
(72,'KABANO','Marcel','01 BP 2878',60871210,'kabanoma@gmail.com'),
(73,'MUJAWIMANA','Claudette','01 BP 3411',55874420,'mujawayo@gmail.com'),
(74,'RUKUNDO','Isaac','01 BP 5878',67874599,'rukundopi@gmail.com'),
(75,'BIGARUKA','Cyprien','01 BP 1421',60877547,'bigarukacyp@gmail.com');

INSERT INTO RoleUtilisateur ( idRole, poste)
VALUES 
(1,'Magasinnier'),
(2,'Comptable'),
(3,'Caissier'),
(4,'Gerant'),
(5,'Patron');

INSERT INTO Utilisateur (idUtilisateur, idRole, nom, email, motDePasse)
VALUES 
('001',1,'BIZIMANA','bizimanab@gmail.com','rutare4'),
('002',2,'RUGARA','rugaaga@gmail.com','kigori2'),
('003',3,'CYAMBARAMUHETO','muhetto@gmail.com','rurayi01'),
('004',4,'RUTIKANGA','rutikangaa@gmail.com','ruguru2o'),
('005',5,'RUTISHISHA','rutishishat@gmail.com','rugata2o');

INSERT INTO Achat (idAchat, idFsseur, idUtilisateur, idArt, date, quantite, prixUnitaire, prixTotal)
VALUES 
(531,71,'001',11,'2022/03/9','50','200000','10000000'),
(532,72,'002',12,'2022/03/10','20','150000','3000000'),
(533,73,'003',13,'2022/03/11','30','200000','6000000'),
(534,74,'004',14,'2022/03/11','40','1000000','40000000'),
(535,75,'005',15,'2022/03/11','10','100000','1000000');

INSERT INTO Vente (idVente , idArt, idUtilisateur, idClient, date, quantite , prixUnitaire, prixTotal)
VALUES 
(671,11,'001',241,'2022/03/10',10,500000,5000000),
(672,12,'002',242,'2022/03/10',10,300000,3000000),
(673,13,'003',243,'2022/03/10',10,350000,3500000),
(674,14,'004',244,'2022/03/10',10,1500000,150000000),
(675,15,'005',245,'2022/03/10',10,350000,3500000);
