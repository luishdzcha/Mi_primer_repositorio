#Instalar paquetes para el Lunes
BiocManager::install("msa")
library(msa)

BiocManager::install("BSgenome")
library(BSgenome)
BiocManager::install("BSgenome", force = TRUE)


BiocManager::install("BSgenome.Ecoli.NCBI.20080805")
library(BSgenome.Ecoli.NCBI.20080805)

BiocManager::install("ggmsa")
library(ggmsa)

BSgenome.Ecoli.NCBI.20080805 -> e_coli_k12
e_coli_k12




BSgenome.Ecoli.NCBI.20080805$NC_008253 -> e_coli_k1
e_coli_k1
letterFrequency(e_coli_k1, "GC")
letterFrequency(e_coli_k1, "GC")/(length(e_coli_k1))
matchPattern("GCT", e_coli_k1, max.mismatch = 1)
translate(e_coli_k1)

BSgenome.Ecoli.NCBI.20080805$NC_010468 -> e_coli_k2
e_coli_k2
letterFrequency(e_coli_k2, "GC")
letterFrequency(e_coli_k2, "GC")/(length(e_coli_k2))


#Alineamiento (Primer método)
BSgenome.Ecoli.NCBI.20080805$NC_000913 -> secuencia_E.Coli1
BSgenome.Ecoli.NCBI.20080805$AC_000091 -> secuencia_E.Coli2
translate(secuencia_E.Coli1) -> proteina1
translate(secuencia_E.Coli2) -> proteina2 

primer_alineamiento <- msa(e_coli_k1, method = "ClustalW")
#PAra juntar las proteínas: todas_juntas <- AASrtingSet(list(proteina1, proteina2))



#Secuencia de globins(Segundo método)
secuencia_globins <- readAAStringSet("C:/Users/alfre/Downloads/DivergentGlobins.fasta")
secuencia_globins
primer_alineamiento1 <- msa(secuencia_globins)
primer_alineamiento1
print(primer_alineamiento1, show="complete")


available.genomes()# Nos dice los organismos disponibles que tenemos
#Instalar genomas de los organismos 
BiocManager::install("BSgenome.Celegans.UCSC.ce10")
library("BSgenome.Celegans.UCSC.ce10")


#Ejercicios 6.7
#Ejercicio 1: Escribe un código que determine si un hongo es potencialmente patógeno. Un hongo que crece óptimamente a 37°C es considerado patógeno.

crecimiento_hongo <- 38
temp_pato <- 37
if(crecimiento_hongo>= temp_pato){
  print("Este hongo es un patógeno")
}else{
  print("Este hongo no es un patógeno")
}
#Ejercicio 2:Una cepa bacteriana ha sido sometida a un test de sensibilidad a antibióticos. Si la zona de inhibición es mayor o igual a 15 mm, clasifícala como sensible; de lo contrario, clasifícala como resistente
cepa_e.coli <- 20
zona_inh <- 15
if(cepa_e.coli>= zona_inh){
  print("La bacteria es sensible")
}else{
  print("La bacteria es resistente")
}
#Ejercicio 3: Clasifica un ambiente acuático según la concentración de oxígeno disuelto: oxigenado (> 8 mg/L), moderado en oxígeno (4-8 mg/L) o anóxico (< 4 mg/L).
conc_oxigeno <- 6
if(conc_oxigeno>8){
  print("Es un ambiente oxigenado")
}else if(conc_oxigeno>4 & conc_oxigeno<8){
  print("Es un ambiente anóxico")
}else{
  print("Es un ambiente moderado en oxígeno")
}

#Ejercicio: Dado un paciente, escribe un código que determine si tiene una infección viral o bacteriana basándote en los niveles de linfocitos (> 4000 sugiere infección viral) y neutrófilos (> 7000 sugiere infección bacteriana).

as.numeric (readline(prompt = "Los niveles de linfocitos de paciente son:")) -> niv_linfo
as.numeric(readline(prompt = "Los niveles de neutrófilos del paciente son:")) -> niv_neut
if(niv_linfo>4000){
  print("Tiene una infección viral")
}else if(niv_neut>7000){
  print("Tiene una infección bacteriana")
}else{
  print("El paciente no tiene ninguna infección")
}


