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
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MANCHE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MANCHE
 (
   ID CHAR(32) NOT NULL  ,
   SCORE CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
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
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MATCHS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATCHS
 (
   ID CHAR(32) NOT NULL  ,
   ID_COMPOSER CHAR(32) NOT NULL  ,
   ID_INCLUE CHAR(32) NOT NULL  ,
   SCOREEQ1 CHAR(32) NULL  ,
   SCOREEQ2 CHAR(32) NULL  
   , PRIMARY KEY (ID) 
 ) 
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
 comment = "";

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
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PARTICIPER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PARTICIPER
 (
   ID CHAR(32) NOT NULL  ,
   ID_1 CHAR(32) NOT NULL  
   , PRIMARY KEY (ID,ID_1) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : JOUER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS JOUER
 (
   ID CHAR(32) NOT NULL  ,
   ID_1 CHAR(32) NOT NULL  
   , PRIMARY KEY (ID,ID_1) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_MATCHS_TOURNOI (ID_COMPOSER)
      REFERENCES TOURNOI (ID) ;


ALTER TABLE MATCHS 
  ADD FOREIGN KEY FK_MATCHS_MANCHE (ID_INCLUE)
      REFERENCES MANCHE (ID) ;


ALTER TABLE TOURNOI 
  ADD FOREIGN KEY FK_TOURNOI_EQUIPE (ID_GAGNANT)
      REFERENCES EQUIPE (ID) ;


ALTER TABLE TOURNOI 
  ADD FOREIGN KEY FK_TOURNOI_USER (ID_REL_1)
      REFERENCES USER (ID) ;


ALTER TABLE MEMBRE 
  ADD FOREIGN KEY FK_MEMBRE_EQUIPE (ID_REL_3)
      REFERENCES EQUIPE (ID) ;


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
  ADD FOREIGN KEY FK_JOUER_MATCHS (ID_1)
      REFERENCES MATCHS (ID) ;

