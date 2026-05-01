cd "D:\Desktop\Unical\Demografia Computazionale\Progetto Per esame"
use EHIS_A2015.dta
*Effetuo un destring di tutte le variabili poichè tranne alcune, le variabili sono tutte codificate come stringhe alfanumeriche anche se si tratta di 1 e 2
destring *, force replace

*Do uno Sguardo al Dataset
describe
summarize

*faccio il tab delle variabili dipendenti
tab alzh, m nol
tab ansia, m nol
tab cd1o, m nol
*i missing sono pochi(<2&) e dopo aver guardato il questionario decidiamo di assimilarli al no

*depressione 0 no 1 si
gen depressione=0
replace depressione=1 if cd1o==1

*alzheimer 0 no 1 si
gen alzheimer=0
replace alzheimer=1 if alzh==1

*ansia 0 no 1 si
gen ansi=0
replace ansi=1 if ansia==1


*Ricodifico l'età in 2 classi 15-64 e 64+ invece che 8
generate eta=0
replace eta=1 if age>=9
tab eta
* rinomino sesso 0 Donna 1 uomo
tab sex
gen sesso=0
replace sesso=1 if sex==2

*rinomino la variabile reddito
rename hhincome reddito
*Ricodifico lo Stato matrimoniale 
tab marstalegal, m nol
gen Celibe=0
replace Celibe=1 if marstalegal==1
gen Coniugato=0
replace Coniugato=1 if marstalegal==2
gen Vedovo=0
replace Vedovo=1 if marstalegal==3
gen Separato_Divorziato=0
replace Separato_Divorziato=1 if marstalegal==4

*ricodifico il livello di educazione
tab hatlevel, m nol
gen Licenza_Elementare=0
replace Licenza_Elementare=1 if hatlevel==1
gen Licenza_Media=0
replace Licenza_Media=1 if hatlevel==2
gen Diploma=0
replace Diploma=1 if hatlevel==3
gen Laurea=0
replace Laurea=1 if hatlevel==4

*Stato Occupazionale
tab mainstat, m nol
gen Disoccupato=0
replace Disoccupato=1 if mainstat==3 | mainstat==4
gen Occupato=0
replace Occupato=1 if mainstat==1
gen Pensionato=0
replace Pensionato=1 if mainstat==2

* Ricodifico il giudizio generale sulla propria salute, imputando i missing nella categoria media
tab hs1, m nol
gen Buona_Salute=0
replace Buona_Salute=1 if hs1==1 | hs1==2

gen Media_Salute=0
replace Media_Salute=1 if hs1==3 | hs1==-1

gen Cattiva_Salute=0
replace Cattiva_Salute=1 if hs1==4 | hs1==5


*Ricodifico ripartizione geografica di residenza in 3 categorie
tab rip, nol m
gen Nord=0
replace Nord=1 if rip==1 | rip==2
gen Centro=0
replace Centro=1 if rip==3
gen Sud=0
replace Sud=1 if rip==4

*Ricodifico le variabili delle Malattie Croniche
tab cd1a, m nol
gen Asma=0
replace Asma=1 if cd1a==1

tab cd1b, m nol
gen Bronchite_Enfisema=0
replace Bronchite_Enfisema=1 if cd1b==1

tab cd1c, m nol
gen Infarto=0
replace Infarto=1 if cd1c==1

tab cd1d, m nol
gen Angina=0
replace Angina=1 if cd1d==1

tab cd1e, m nol
gen Ipertensione=0
replace Ipertensione=1 if cd1e==1

tab cd1f, m nol
gen Ictus=0
replace Ictus=1 if cd1f==1

tab cd1g, m nol
gen Artrosi_Artrite=0
replace Artrosi_Artrite=1 if cd1g==1

tab cd1h, m nol
gen Lombalgia=0
replace Lombalgia=1 if cd1h==1

tab cd1i, m nol
gen Cervicalgia=0
replace Cervicalgia=1 if cd1i==1

tab cd1j, m nol
gen Diabete=0
replace Diabete=1 if cd1j==1

tab cd1k, m nol
gen Allergia=0
replace Allergia=1 if cd1k==1

tab cd1l, m nol
gen Cirrosi=0
replace Cirrosi=1 if cd1l==1

tab cd1m, m nol
gen Incontinenza=0
replace Incontinenza=1 if cd1m==1

tab cd1n, m nol
gen Problemi_Renali=0
replace Problemi_Renali=1 if cd1n==1

tab cuore, m nol
gen Altre_Cuore=0
replace Altre_Cuore=1 if cuore==1

tab inren , m nol
gen Insufficenza_Renale=0
replace Insufficenza_Renale=1 if inren ==1

tab tumor, m nol
gen Tumori=0
replace Tumori=1 if tumor==1

tab parkin, m nol
gen Parkinson=0
replace Parkinson=1 if parkin==1

tab altcro, m nol
gen Altre_Croniche=0
replace Altre_Croniche=1 if altcro==1
/*

*Ricodifico le variabili dell'attività fisica a lavoro... Eliminata per collinearità
*Lavoro Sedentario, movimento moderato o sforzo fisico
tab pe1 
gen Sedentario=0
replace Sedentario=1 if pe1==1 | pe1==4 | pe1==-1
gen Mov_Moderato=0
replace Mov_Moderato=1 if pe1==2
gen Mov_Pesante=0
replace Mov_Pesante=1 if pe1==3
*/
*Giorni in cui cammina a piedi, faremo 2 categorie cammina e non cammina
tab pe2 

gen Cammina=0
replace Cammina=1 if pe2>=1

/*
*Quante ore al giorno cammina, faremo 3 categorie, meno di 1 ora, da 1 a 3 ore, piu di 3 ore, escludiamo i non Applicable che sono quelli che non camminano, eliminata per collinearità
tab pe3 
gen Camm_Meno_Di_1_ora=0
replace Camm_Meno_Di_1_ora=1 if pe3==1 | pe3==2
gen Camm_Tra_1e3_ore=0
replace Camm_Tra_1e3_ore=1 if pe3==3 | pe3==4
gen Camm_piudi3_ore=0
replace Camm_piudi3_ore=1 if pe3==5
*/
*Giorni in cui va in bicicletta, faremo 2 categorie va e non va
tab pe4 
gen Vainbici=0
replace Vainbici=1 if pe4>=1

*Quante ore al giorno va in bici , faremo 3 categorie come sopra
tab pe5
gen Bici_Meno_Di_1_ora=0
replace Bici_Meno_Di_1_ora=1 if pe5==1 | pe5==2
gen Bici_Tra_1e3_ore=0
replace Bici_Tra_1e3_ore=1 if pe5==3 | pe5==4
gen Bici_piudi3_ore=0
replace Bici_piudi3_ore=1 if pe5==5

*Giorni in cui Pratica attività sportiva, faremo 3 categorie, no attivita, - di 2 volte e + di 2 volte a sett
tab pe6 
gen No_Attfisica=0
replace No_Attfisica=1 if pe6<=0
gen AttFisica_2Sett=0
replace AttFisica_2Sett=1 if pe6==1 | pe6==2
gen AttFisica_P2Sett=0
replace AttFisica_P2Sett=1 if pe6>=3

*Fumatore si nolgen Fumatore=0
tab sk1
gen Fumatore=0
replace Fumatore=1 if sk1==1 | sk1==2
/*
*Quanto Fuma, Ocaasionale, Abituale, Incallito= Eliminata per collinearità
tab sk3
gen Occasionale=0
replace Occasionale=1 if sk3<=2
gen Abituale=0 
replace Abituale=1 if sk3>=3 & sk3<=8
gen Incallito=0
replace Incallito=1 if sk3>=9
*/
* Fumo Passivo
tab sk4
gen Esposto_pass=0
replace Esposto_pass=1 if sk4==1 | sk4==2

* Mangia Frutta
tab fv1
gen Non_Mangia_Frutta=0
replace Non_Mangia_Frutta=1 if fv1==5 | fv1==-1
gen Mangia_Frutta_menodi1vg=0
replace Mangia_Frutta_menodi1vg=1 if fv1>=2 & fv1<=4
gen Mangia_Frutta_Tuttig=0
replace Mangia_Frutta_Tuttig=1 if fv1==1


*Mangia Verdura
tab fv3
gen Non_Mangia_Verd=0
replace Non_Mangia_Verd=1 if fv3==5 | fv3==-1
gen Mangia_Verd_menodi1vg=0
replace Mangia_Verd_menodi1vg=1 if fv3>=2 & fv3<=4
gen Mangia_Verd_Tuttig=0
replace Mangia_Verd_Tuttig=1 if fv3==1


*medico di famiglia
gen Medicofam_Ultimi12m=0
replace Medicofam_Ultimi12m=1 if am2==1
*Frequenza Medico Famiglia
tab am3
gen Medicofam_meno1voltmese=0
replace Medicofam_meno1voltmese=1 if am3>=0 & am3<=12
gen Medicofam_piu1voltmese=0
replace Medicofam_piu1voltmese=1 if am3>=12
*Visita Specialistica Ultimo Anno
tab am4
gen VisitaSpec_UltimoAnno=0
replace VisitaSpec_UltimoAnno=1 if am4==1
/* Collinearità
*Frequenza Visite Specialistiche ultimo Anno
tab am5
gen Alm1_VisitaSpec=0
replace Alm1_VisitaSpec=1 if am5<=1
gen Piu1_VisitaSpec=0
replace Piu1_VisitaSpec=1 if am5>=2
*/
*Assistenza Domiciliare
tab am7
gen Ass_Domiciliare=0
replace Ass_Domiciliare=1 if am7==1
*si vaccina Spesso
tab pa1
gen SiVaccinaSpesso=0
replace SiVaccinaSpesso=1 if pa1==1

*Controlla Pressione ultimo anno
tab pa2
gen Contr_Pressione=0
replace Contr_Pressione=1 if pa2==1

*controlla Colosterolo ultimo anno
tab pa3
gen Contr_Colest=0
replace Contr_Colest=1 if pa3==1

*Controlla Glicemia ultimo anno
tab pa4
gen Contr_Glic=0
replace Contr_Glic=1 if pa4==1

*Controlla Sangue Occulto
tab pa5
gen Contr_Sang=0
replace Contr_Sang=1 if pa5==1

*colonoscopia ultimo anno
tab pa6
gen Colonscop_UltAnno=0
replace Colonscop_UltAnno=1 if pa6==1

*Mammografia Ultimo Anno
tab pa7
gen Mammogr_UltAnno=0
replace Mammogr_UltAnno=1 if pa7==1

*Pap test ultimo anno
tab pa8
gen Papte_UltAnno=0
replace Papte_UltAnno=1 if pa8==1

global Sociodemografiche "sesso eta Coniugato Separato_Divorziato Vedovo Licenza_Elementare Diploma Laurea Occupato Pensionato Nord Sud reddito "
*Reference sesso donna, Stato legale celibe educazione Licenza_Media Stato lavorativo Disoccupato Ripartizione Centro, Reddito alto
global Croniche "Asma Bronchite_Enfisema Infarto Angina Ipertensione Ictus Artrosi_Artrite Lombalgia Cervicalgia Diabete Allergia Cirrosi Incontinenza Problemi_Renali Altre_Cuore Insufficenza_Renale Tumori Parkinson Altre_Croniche"
global Attivita " Cammina Vainbici Bici_piudi3_ore AttFisica_2Sett AttFisica_P2Sett"
*reference Sedentario, Camm_Meno_Di_1_ora, Bici_Meno_Di_1_ora, No_Attfisica
global FumoeAlimentazione "Fumatore Esposto_pass Mangia_Frutta_menodi1vg Mangia_Frutta_Tuttig Mangia_Verd_menodi1vg Mangia_Verd_Tuttig"
*reference Non fumatore, non esposto fumo passivo, non mangia Frutta, non mangia verdure
global Prevenzione " Medicofam_Ultimi12m Medicofam_meno1voltmese Medicofam_piu1voltmese VisitaSpec_UltimoAnno Ass_Domiciliare SiVaccinaSpesso Contr_Pressione Contr_Colest Contr_Glic Contr_Sang Colonscop_UltAnno Mammogr_UltAnno Papte_UltAnno"


quietly logit alzheimer  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione $Prevenzione   , r or
estimate store alz1

quietly logit ansi  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione $Prevenzione , r or
estimate store ansia1

quietly logit depressione  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione $Prevenzione  , r or
estimate store depre1

quietly logit alzheimer  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione  , r or
estimate store alz2

quietly logit ansi  $Sociodemografiche $Croniche  $Attivita $FumoeAlimentazione  , r or
estimate store ansia2

quietly logit depressione  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione  , r or
estimate store depre2

quietly logit alzheimer  $Sociodemografiche $Croniche  , r or
estimate store alz3

quietly logit ansi  $Sociodemografiche $Croniche , r or
estimate store ansia3

quietly logit depressione  $Sociodemografiche $Croniche , r or
estimate store depre3

esttab alz1 alz2 alz3  , se
esttab ansia1 ansia2 ansia3 , se 
esttab depre1 depre2 depre3 , se

*Dopo Attenta analisi notiamo che aggiungendo i pesi alle variabili gli standard error peggiorano, dunque useremo il modello senza pesi
*Modelli finali
logit alzheimer  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione , r or

logit ansi  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione , r or

logit depressione  $Sociodemografiche $Croniche $Attivita $FumoeAlimentazione   , r or
