DROP DATABASE IF EXISTS MLR1;

CREATE DATABASE IF NOT EXISTS MLR1;
USE MLR1;
# -----------------------------------------------------------------------------
#       TABLE : USER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS USER
 (
   ID CHAR(32) NOT NULL  ,
   EMAIL CHAR(32) NULL  ,
   NAME CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       TABLE : MANCHE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MANCHE
 (
   ID CHAR(32) NOT NULL  ,
   SCORE CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : EQUIPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPE
 (
   ID CHAR(32) NOT NULL  ,
   NOM CHAR(32) NULL  ,
   POINTS CHAR(32) NULL  ,
   IMAGE CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TOURNOI
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TOURNOI
 (
   ID CHAR(32) NOT NULL  ,
   ID_GAGNANT CHAR(32) NOT NULL  ,
   ID_REL_1 CHAR(32) NOT NULL  ,
   NOM CHAR(32) NULL  ,
   NOMJEU CHAR(32) NULL  ,
   DATEDEB CHAR(32) NULL  ,
   DATEFIN CHAR(32) NULL  ,
   DATDEBINSCR CHAR(32) NULL  ,
   DATEFININSCR CHAR(32) NULL  ,
   TYPEDETOURNOI CHAR(32) NULL  ,
   STATUTS CHAR(32) NULL  ,
   NBREINSCRIPTION CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE TOURNOI
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_TOURNOI_EQUIPE
     ON TOURNOI (ID_GAGNANT ASC);

CREATE  INDEX I_FK_TOURNOI_USER
     ON TOURNOI (ID_REL_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : MEMBRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEMBRE
 (
   ID CHAR(32) NOT NULL  ,
   ID_REL_3 CHAR(32) NOT NULL  ,
   PSEUDO CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEMBRE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEMBRE_EQUIPE
     ON MEMBRE (ID_REL_3 ASC);

# -----------------------------------------------------------------------------
#       TABLE : MATCH
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATCH
 (
   ID CHAR(32) NOT NULL  ,
   ID_COMPOSER CHAR(32) NOT NULL  ,
   ID_INCLUE CHAR(32) NOT NULL  ,
   SCOREEQ1 CHAR(32) NULL  ,
   SCOREEQ2 CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MATCH
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MATCH_TOURNOI
     ON MATCH (ID_COMPOSER ASC);

CREATE  INDEX I_FK_MATCH_MANCHE
     ON MATCH (ID_INCLUE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPER
 (
   ID CHAR(32) NOT NULL  ,
   ID_1 CHAR(32) NOT NULL  
   , PRIMARY KEY (ID,ID_1) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PARTICIPER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PARTICIPER_EQUIPE
     ON PARTICIPER (ID ASC);

CREATE  INDEX I_FK_PARTICIPER_TOURNOI
     ON PARTICIPER (ID_1 ASC);

# -----------------------------------------------------------------------------
#       TABLE : JOUER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS JOUER
 (
   ID CHAR(32) NOT NULL  ,
   ID_1 CHAR(32) NOT NULL  
   , PRIMARY KEY (ID,ID_1) 
 ) 
 ENGINE=InnoDB
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE JOUER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_JOUER_EQUIPE
     ON JOUER (ID ASC);

CREATE  INDEX I_FK_JOUER_MATCH
     ON JOUER (ID_1 ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE TOURNOI 
  ADD FOREIGN KEY FK_TOURNOI_EQUIPE (ID_GAGNANT)
      REFERENCES EQUIPE (ID) ;


ALTER TABLE TOURNOI 
  ADD FOREIGN KEY FK_TOURNOI_USER (ID_REL_1)
      REFERENCES USER (ID) ;


ALTER TABLE MEMBRE 
  ADD FOREIGN KEY FK_MEMBRE_EQUIPE (ID_REL_3)
      REFERENCES EQUIPE (ID) ;


ALTER TABLE MATCH 
  ADD FOREIGN KEY FK_MATCH_TOURNOI (ID_COMPOSER)
      REFERENCES TOURNOI (ID) ;


ALTER TABLE MATCH 
  ADD FOREIGN KEY FK_MATCH_MANCHE (ID_INCLUE)
      REFERENCES MANCHE (ID) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_EQUIPE (ID)
      REFERENCES EQUIPE (ID) ;


ALTER TABLE PARTICIPER 
  ADD FOREIGN KEY FK_PARTICIPER_TOURNOI (ID_1)
      REFERENCES TOURNOI (ID) ;


ALTER TABLE JOUER 
  ADD FOREIGN KEY FK_JOUER_EQUIPE (ID)
      REFERENCES EQUIPE (ID) ;


ALTER TABLE JOUER 
  ADD FOREIGN KEY FK_JOUER_MATCH (ID_1)
      REFERENCES MATCH (ID) ;