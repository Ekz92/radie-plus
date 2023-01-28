CREATE TABLE INIT_GESTIONNAIRE(
	id_init_gest int primary key identity(1,1),
	code_gest varchar(5),
	nom_gest varchar(100)
)

CREATE TABLE Import_Credit_CR(
	num_credit int,
	type_credit varchar(10),
	montant_credit decimal(12,2),
	montant_paye decimal(12,2),
	solde decimal(12,2),
	code_client varchar(30),
	compte_client varchar(30),
	nom_client varchar(150),
	gest_old varchar (5),
	date_radie datetime	
)
CREATE TABLE Import_prelevement(
	num_credit int,
	code_client varchar(30),
	compte_client varchar (30),
	nom_client varchar (150),
	Montant decimal(12,2),
	date_operation varchar(50),
	code_gestionnaire varchar(5),
);

CREATE TABLE CR_GESTIONNAIRE(
	ig_gest int primary key identity(1,1),
	code_gest varchar(5)
	nom_gest varchar (100),
)

CREATE TABLE CR_DETAILS_PAYE(
	id_cr_dp int primary key identity(1,1),
	num_credit int,
	num_membre varchar(30),
	num_compte varchar(30),
	nom_membre varchar(150),
	payement decimal(12,2),
	date_paye datetime,
	usager varchar (5),
	code_gest varchar(5)
)

CREATE TABLE CR_PAYE(
	id_cr_paye int primary key identity(1,1),
	num_compte varchar(30),
	num_credit int,
	nom_membre varchar(150),
	montant_credit decimal(12,2),
	montant_paye decimal(12,2),
	interet_calc decimal(12,2),
	solde decimal(12,2)
)

CREATE TABLE CR_CREDIT(
	id_credit int primary key identity(1,1),
	num_credit int,
	cod_credit varchar(10),
	date_debloc datetime,
	montant_credit decimal(12,2),
	montant_paye decimal(12,2),
	solde_old decimal(12,2),
	interet_calc decimal(12,2),
	solde decimal(12,2),
	cod_client varchar(30),
	compte_client varchar(30),
	nom_client varchar(150),
	code_gest varchar(5),
	gest_old varchar (5),
	date_radie datetime
)

CREATE TABLE CR_USER(
	id_user int primary key identity(1,1),
	nom_user varchar(150),
	usager varchar (5),
	motdepass varchar(50),
	date_crea datetime,
	code_profil varchar(7)
)

CREATE TABLE CR_PROFIL(
	id_profil int primary key identity(1,1),
	code_profil varchar(7),
	nom_profil varchar(50)
)