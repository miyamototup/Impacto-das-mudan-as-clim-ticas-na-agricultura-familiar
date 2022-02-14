#Mapa com distribuição das estações meteorológicas do INMET
#Acho que vou deixar esse mapa para lá por enquanto para não dar arma para alimentar o inimigo,
# no sentido que vai ficar muito fácil atacar o trabalho se eu mostrar a dispersão das estações
#meteorológicas no território brasileiro.

#AREAS MÍNIMAS COMPARÁVEIS
#Preciso converter a tabela dadosclimaanobr que está por munícípios para áreas mínimas comparáveis
#só assim poderei comparar todos os municípios ao longo do tempo
#Carrega tabela de áreas mínimas comparáveis
AMC=read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Area mínima comparável/AMCs.csv")
AMC=AMC[,c(2,9)]
#As AMCs são baseadas em uma malha antiga do IBGE. Os dados de produção e climáticos
#são para os 5565 municípios da base de 2010. Quer dizer que ao compatibiliar AMCs com municípiios
# vai ter  município sem código de AMCs porque eles podem ter sido criados depois
# da malha de AMCs que segundo o gori foi criada no começo dos anos 2000
#Preciso ver qual município se emancipou apos a criação das AMCs e alterar o código manualmente
# para enviar espaços em branco nos mapas e ausencia de valores nos modelos
mun5565=read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Area mínima comparável/5565 municipios.csv",header=T)
mun5565=mun5565[,c(1,2,5)]

emancipa=merge(AMC,mun5565,by.x=c('UFMUNDV'),by.y=c('Codigo'),all.x=T,all.y=T)
emancipa$NEW_CODE_1970_1997[680]=emancipa$NEW_CODE_1970_1997[826]
emancipa$NEW_CODE_1970_1997[4917]=emancipa$NEW_CODE_1970_1997[4756]
emancipa$NEW_CODE_1970_1997[4604]=emancipa$NEW_CODE_1970_1997[4633]
emancipa$NEW_CODE_1970_1997[803]=emancipa$NEW_CODE_1970_1997[882]
emancipa$NEW_CODE_1970_1997[4611]=emancipa$NEW_CODE_1970_1997[4692]
emancipa$NEW_CODE_1970_1997[4626]=emancipa$NEW_CODE_1970_1997[4914]
emancipa$NEW_CODE_1970_1997[1867]=emancipa$NEW_CODE_1970_1997[2201]
emancipa$NEW_CODE_1970_1997[4649]=emancipa$NEW_CODE_1970_1997[4805]
emancipa$NEW_CODE_1970_1997[4650]=emancipa$NEW_CODE_1970_1997[4728]
emancipa$NEW_CODE_1970_1997[5195]=emancipa$NEW_CODE_1970_1997[5182]
emancipa$NEW_CODE_1970_1997[4658]=emancipa$NEW_CODE_1970_1997[4805]
emancipa$NEW_CODE_1970_1997[5372]=emancipa$NEW_CODE_1970_1997[5334]
emancipa$NEW_CODE_1970_1997[820]=emancipa$NEW_CODE_1970_1997[673]
emancipa$NEW_CODE_1970_1997[1142]=emancipa$NEW_CODE_1970_1997[1237]
emancipa$NEW_CODE_1970_1997[4684]=emancipa$NEW_CODE_1970_1997[4835]
emancipa$NEW_CODE_1970_1997[4685]=emancipa$NEW_CODE_1970_1997[4834]
emancipa$NEW_CODE_1970_1997[4687]=emancipa$NEW_CODE_1970_1997[4975]
emancipa$NEW_CODE_1970_1997[5210]=emancipa$NEW_CODE_1970_1997[5191]
emancipa$NEW_CODE_1970_1997[5213]=emancipa$NEW_CODE_1970_1997[5271]
emancipa$NEW_CODE_1970_1997[4718]=emancipa$NEW_CODE_1970_1997[4878]
emancipa$NEW_CODE_1970_1997[4722]=emancipa$NEW_CODE_1970_1997[4778]
emancipa$NEW_CODE_1970_1997[4729]=emancipa$NEW_CODE_1970_1997[4674]
emancipa$NEW_CODE_1970_1997[1690]=emancipa$NEW_CODE_1970_1997[1741]
emancipa$NEW_CODE_1970_1997[5216]=emancipa$NEW_CODE_1970_1997[5197]
emancipa$NEW_CODE_1970_1997[5134]=emancipa$NEW_CODE_1970_1997[5118]
emancipa$NEW_CODE_1970_1997[4775]=emancipa$NEW_CODE_1970_1997[4835]
emancipa$NEW_CODE_1970_1997[5408]=emancipa$NEW_CODE_1970_1997[5544]
emancipa$NEW_CODE_1970_1997[3123]=emancipa$NEW_CODE_1970_1997[3115]
emancipa$NEW_CODE_1970_1997[2061]=emancipa$NEW_CODE_1970_1997[1865]
emancipa$NEW_CODE_1970_1997[5430]=emancipa$NEW_CODE_1970_1997[5380]
emancipa$NEW_CODE_1970_1997[5228]=emancipa$NEW_CODE_1970_1997[5306]
emancipa$NEW_CODE_1970_1997[5229]=emancipa$NEW_CODE_1970_1997[5306]
emancipa$NEW_CODE_1970_1997[3217]=emancipa$NEW_CODE_1970_1997[3224]
emancipa$NEW_CODE_1970_1997[4818]=emancipa$NEW_CODE_1970_1997[5054]
emancipa$NEW_CODE_1970_1997[4823]=emancipa$NEW_CODE_1970_1997[4908]
emancipa$NEW_CODE_1970_1997[4831]=emancipa$NEW_CODE_1970_1997[5038]
emancipa$NEW_CODE_1970_1997[5451]=emancipa$NEW_CODE_1970_1997[5436]
emancipa$NEW_CODE_1970_1997[4855]=emancipa$NEW_CODE_1970_1997[4667]
emancipa$NEW_CODE_1970_1997[5250]=emancipa$NEW_CODE_1970_1997[5179]
emancipa$NEW_CODE_1970_1997[5252]=emancipa$NEW_CODE_1970_1997[5230]
emancipa$NEW_CODE_1970_1997[5264]=emancipa$NEW_CODE_1970_1997[5299]
emancipa$NEW_CODE_1970_1997[4893]=emancipa$NEW_CODE_1970_1997[4717]
emancipa$NEW_CODE_1970_1997[4909]=emancipa$NEW_CODE_1970_1997[4751]
emancipa$NEW_CODE_1970_1997[4911]=emancipa$NEW_CODE_1970_1997[4753]
emancipa$NEW_CODE_1970_1997[4939]=emancipa$NEW_CODE_1970_1997[4751]
emancipa$NEW_CODE_1970_1997[4951]=emancipa$NEW_CODE_1970_1997[5003]
emancipa$NEW_CODE_1970_1997[5290]=emancipa$NEW_CODE_1970_1997[5191]
emancipa$NEW_CODE_1970_1997[4964]=emancipa$NEW_CODE_1970_1997[5041]
emancipa$NEW_CODE_1970_1997[5293]=emancipa$NEW_CODE_1970_1997[5288]
emancipa$NEW_CODE_1970_1997[4969]=emancipa$NEW_CODE_1970_1997[4988]
emancipa$NEW_CODE_1970_1997[4999]=emancipa$NEW_CODE_1970_1997[4961]
emancipa$NEW_CODE_1970_1997[5295]=emancipa$NEW_CODE_1970_1997[5255]
emancipa$NEW_CODE_1970_1997[5297]=emancipa$NEW_CODE_1970_1997[5261]
emancipa$NEW_CODE_1970_1997[5011]=emancipa$NEW_CODE_1970_1997[4898]
emancipa$NEW_CODE_1970_1997[5301]=emancipa$NEW_CODE_1970_1997[5182]
emancipa$NEW_CODE_1970_1997[5051]=emancipa$NEW_CODE_1970_1997[5089]
emancipa$NEW_CODE_1970_1997[5311]=emancipa$NEW_CODE_1970_1997[5271]
emancipa$NEW_CODE_1970_1997[5098]=emancipa$NEW_CODE_1970_1997[5050]

#Aqui só salvei por medo de perder trabalho caso a númeração das linhas das tabelas mude 
#da próxima vez que eu reiniciar o computador
#setwd("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Area mínima comparável")
#write.csv(emancipa,file="emancipa",row.names=F)

AMC=emancipa[,c(1,2)]

#milho
#Converter base de municípios para AMCs
#O argumento na.strings=c("","NA") faz com que todos os espaços em branco da tabela (que tenham o caracter "-" ) sejam preenchidos por missings
milho = read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/milho4.csv", header=TRUE, na.strings = c("-","NA"))

#Evolução da produtividade de milho
#mil=merge(milho,mun5565,by=c('Codigo'))
#mil$regiao[mil$UF=='ACRE'|mil$UF=='AMAPÁ'|mil$UF=='AMAZONAS'|mil$UF=='PARÁ'|mil$UF=='RONDÔNIA'|mil$UF=='RORAIMA'|mil$UF=='TOCANTINS']='Norte'
#mil$regiao[mil$UF=='ALAGOAS'|mil$UF=='BAHIA'|mil$UF=='CEARÁ'|mil$UF=='MARANHÃO'|mil$UF=='PARAÍBA'|mil$UF=='PERNAMBUCO'|mil$UF=='PIAUÍ'|mil$UF=='RIO GRANDE DO NORTE'|mil$UF=='SERGIPE']='Nordeste'
#mil$regiao[mil$UF=='DISTRITO FEDERAL'|mil$UF=='GOIÁS'|mil$UF=='MATO GROSSO'|mil$UF=='MATO GROSSO DO SUL']='Centro-Oeste'
#mil$regiao[mil$UF=='ESPÍRITO SANTO'|mil$UF=='MINAS GERAIS'|mil$UF=='RIO DE JANEIRO'|mil$UF=='SÃO PAULO']='Sudeste'
#mil$regiao[mil$UF=='RIO GRANDE DO SUL'|mil$UF=='SANTA CATARINA'|mil$UF=='PARANÁ']='Sul'
#milprodutividade=aggregate(mil[,c(3)],by=list(Regiao=mil$regiao,Ano=mil$Ano),mean,na.rm=T)
#setwd('/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Resultados - 2')
#write.csv(milprodutividade,file='Evolução da produtividade de milho por região',row.names=F)

milho=merge(milho,AMC,by.x=c('Codigo'),by.y=c('UFMUNDV'),all.x=T,all.y=T)
milho=aggregate(milho[,c(3)],by=list(AMC=milho$NEW_CODE_1970_1997,Ano=milho$Ano),mean,na.rm=T)
milho$logmilho=log(milho$x)
#Faz com que os valores infinitos da coluna logmilho (Inf-Inf) sejam substituídos por NA
milho$logmilho[!is.finite(milho$logmilho)]=NA
colnames(milho)[3]="Produtividade"
milho=na.omit(milho)




#Feijão
feijao= read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/feijao.csv", header=TRUE, na.strings = c("-","NA"))

#fej=merge(feijao,mun5565,by.x=c('Municipio'),by.y=c('Codigo'))
#fej$regiao[fej$UF=='ACRE'|fej$UF=='AMAPÁ'|fej$UF=='AMAZONAS'|fej$UF=='PARÁ'|fej$UF=='RONDÔNIA'|fej$UF=='RORAIMA'|fej$UF=='TOCANTINS']='Norte'
#fej$regiao[fej$UF=='ALAGOAS'|fej$UF=='BAHIA'|fej$UF=='CEARÁ'|fej$UF=='MARANHÃO'|fej$UF=='PARAÍBA'|fej$UF=='PERNAMBUCO'|fej$UF=='PIAUÍ'|fej$UF=='RIO GRANDE DO NORTE'|fej$UF=='SERGIPE']='Nordeste'
#fej$regiao[fej$UF=='DISTRITO FEDERAL'|fej$UF=='GOIÁS'|fej$UF=='MATO GROSSO'|fej$UF=='MATO GROSSO DO SUL']='Centro-Oeste'
#fej$regiao[fej$UF=='ESPÍRITO SANTO'|fej$UF=='MINAS GERAIS'|fej$UF=='RIO DE JANEIRO'|fej$UF=='SÃO PAULO']='Sudeste'
#fej$regiao[fej$UF=='RIO GRANDE DO SUL'|fej$UF=='SANTA CATARINA'|fej$UF=='PARANÁ']='Sul'
#fejprodutividade=aggregate(fej[,c(3)],by=list(Regiao=fej$regiao,Ano=fej$Ano),mean,na.rm=T)
#setwd('/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Resultados - 2')
#write.csv(fejprodutividade,file='Evolução da produtividade de feijao por região',row.names=F)

feijao=merge(feijao,AMC,by.x=c('Municipio'),by.y=c('UFMUNDV'),all.x=T,all.y=T)
feijao=aggregate(feijao[,c(3)],by=list(AMC=feijao$NEW_CODE_1970_1997,Ano=feijao$Ano),mean,na.rm=T)
feijao$logfeijao=log(feijao$x)
feijao$logfeijao[!is.finite(feijao$logfeijao)]=NA
colnames(feijao)[3]="Produtividade"
feijao=na.omit(feijao)

#Mandioca
mandioca=read.csv('file:///home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/mandioca-21.csv',
                  header=F,skip=4,sep=';')
mandioca=mandioca[c(1:139125),]
library(tidyr)
mandioca=separate(mandioca,V1,c('Codigo','Municipio','UF'),sep=' - ')
mandioca=mandioca[,c(1,4,5)]
colnames(mandioca)=c("Municipio","Ano","Produtividade")
mandioca$Produtividade=as.numeric(levels(mandioca$Produtividade)[mandioca$Produtividade])


#Um problema com os dados da mandioca é que não tem nenhuma cidade do centro oeste
#corrigido
#man=merge(mandioca,mun5565,by.x=c('Municipio'),by.y=c('Codigo'))
#man$regiao[man$UF=='ACRE'|man$UF=='AMAPÁ'|man$UF=='AMAZONAS'|man$UF=='PARÁ'|man$UF=='RONDÔNIA'|man$UF=='RORAIMA'|man$UF=='TOCANTINS']='Norte'
#man$regiao[man$UF=='ALAGOAS'|man$UF=='BAHIA'|man$UF=='CEARÁ'|man$UF=='MARANHÃO'|man$UF=='PARAÍBA'|man$UF=='PERNAMBUCO'|man$UF=='PIAUÍ'|man$UF=='RIO GRANDE DO NORTE'|man$UF=='SERGIPE']='Nordeste'
#man$regiao[man$UF=='DISTRITO FEDERAL'|man$UF=='GOIÁS'|man$UF=='MATO GROSSO'|man$UF=='MATO GROSSO DO SUL']='Centro-Oeste'
#man$regiao[man$UF=='ESPÍRITO SANTO'|man$UF=='MINAS GERAIS'|man$UF=='RIO DE JANEIRO'|man$UF=='SÃO PAULO']='Sudeste'
#man$regiao[man$UF=='RIO GRANDE DO SUL'|man$UF=='SANTA CATARINA'|man$UF=='PARANÁ']='Sul'
#manprodutividade=aggregate(man[,c(3)],by=list(Regiao=man$regiao,Ano=man$Ano),mean,na.rm=T)
#setwd('/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Resultados - 2')
#write.csv(manprodutividade,file='Evolução da produtividade de mandioca por região',row.names=F)


mandioca=merge(mandioca,AMC, by.x=c('Municipio'),by.y=c('UFMUNDV'),all.x=T,all.y=T)
mandioca=aggregate(mandioca[,c(3)],by=list(AMC=mandioca$NEW_CODE_1970_1997,Ano=mandioca$Ano),mean,na.rm=T)
mandioca$logmandioca=log(mandioca$x)
mandioca$logmandioca[!is.finite(mandioca$logmandioca)]=NA
colnames(mandioca)[3]="Produtividade"
mandioca=na.omit(mandioca)



#Carrega dados climáticos
load("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/dadosclimaanobr.RData")
dadosclimaanobr=merge(dadosclimaanobr,AMC, by.x=c('Codigo'),by.y=('UFMUNDV'),all.x=T,all.y=T)

#clim=merge(dadosclimaanobr,mun5565,by=c('Codigo'))
#clim=clim[clim$Ano>=1990,c(1,2,4,7,10,21,22)]
#colnames(clim)[7]=c('UF')
#clim$regiao[clim$UF=='ACRE'|clim$UF=='AMAPÁ'|clim$UF=='AMAZONAS'|clim$UF=='PARÁ'|clim$UF=='RONDÔNIA'|clim$UF=='RORAIMA'|clim$UF=='TOCANTINS']='Norte'
#clim$regiao[clim$UF=='ALAGOAS'|clim$UF=='BAHIA'|clim$UF=='CEARÁ'|clim$UF=='MARANHÃO'|clim$UF=='PARAÍBA'|clim$UF=='PERNAMBUCO'|clim$UF=='PIAUÍ'|clim$UF=='RIO GRANDE DO NORTE'|clim$UF=='SERGIPE']='Nordeste'
#clim$regiao[clim$UF=='DISTRITO FEDERAL'|clim$UF=='GOIÁS'|clim$UF=='MATO GROSSO'|clim$UF=='MATO GROSSO DO SUL']='Centro-Oeste'
#clim$regiao[clim$UF=='ESPÍRITO SANTO'|clim$UF=='MINAS GERAIS'|clim$UF=='RIO DE JANEIRO'|clim$UF=='SÃO PAULO']='Sudeste'
#clim$regiao[clim$UF=='RIO GRANDE DO SUL'|clim$UF=='SANTA CATARINA'|clim$UF=='PARANÁ']='Sul'
#climtemppluv=aggregate(clim[,c(4,5)],by=list(Regiao=clim$regiao,Ano=clim$Ano),mean,na.rm=T)
#setwd('/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Resultados - 2')
#write.csv(climtemppluv,file='Evolução da temperatura e da precipitação por região',row.names=F)


#Leite
#######Produtividade do leite, produção do leite e vacas ordenhadas
#Vacas ordenhadas
vacasordenhadas=read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/vacas ordenhadas.csv",header=T,na.strings = c("-","NA"))
vacasordenhadas=merge(vacasordenhadas,AMC,by.x=c('Municipio'),by.y=c('UFMUNDV'),all.x=T,all.y=T)
vacasordenhadas=aggregate(vacasordenhadas[,c(3)],by=list(AMC=vacasordenhadas$NEW_CODE_1970_1997,Ano=vacasordenhadas$Ano),sum,na.rm=T)
colnames(vacasordenhadas)[3]="Numero de vacas"

# Produção de leite
leite = read.csv("/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/leite.csv", header=TRUE, na.strings = c("-","NA")) 
leite=merge(leite,AMC,by.x=c('Codigo'),by.y=c('UFMUNDV'),all.x=T,all.y=T)
leite=aggregate(leite[,c(5)],by=list(AMC=leite$NEW_CODE_1970_1997,Ano=leite$Ano),sum,na.rm=T)
colnames(leite)[3]="Producao de leite"


#Log, Produtividade,produção e número de vacas de leite
leite=merge(leite,vacasordenhadas,by.x=c('AMC','Ano'),by.y=c('AMC','Ano'),all.x=T,all.y=T)
leite$produtividade=leite$`Producao de leite`/leite$`Numero de vacas`
leite$logprodutividade=log(leite$produtividade)
leite$logproducao=log(leite$`Producao de leite`)
leite$logvacas=log(leite$`Numero de vacas`)
leite$logproducao[!is.finite(leite$logproducao)]=NA
leite$logprodutividade[!is.finite(leite$logprodutividade)]=NA
leite$logvacas[!is.finite(leite$logvacas)]=NA
leite=na.omit(leite)
leite=leite[,c(1,2,5,6)]

#amcuf=merge(AMC,mun5565,by.x=c('UFMUNDV'),by.y=c('Codigo'))
#amcuf=amcuf[,c(2,4)]
#amcuf=unique(amcuf)
#Evolução da produtividade de leite
#lei=merge(leite,amcuf,by.x=c('AMC'),by.y=c('NEW_CODE_1970_1997'))
#lei$regiao[lei$UF=='ACRE'|lei$UF=='AMAPÁ'|lei$UF=='AMAZONAS'|lei$UF=='PARÁ'|lei$UF=='RONDÔNIA'|lei$UF=='RORAIMA'|lei$UF=='TOCANTINS']='Norte'
#lei$regiao[lei$UF=='ALAGOAS'|lei$UF=='BAHIA'|lei$UF=='CEARÁ'|lei$UF=='MARANHÃO'|lei$UF=='PARAÍBA'|lei$UF=='PERNAMBUCO'|lei$UF=='PIAUÍ'|lei$UF=='RIO GRANDE DO NORTE'|lei$UF=='SERGIPE']='Nordeste'
#lei$regiao[lei$UF=='DISTRITO FEDERAL'|lei$UF=='GOIÁS'|lei$UF=='MATO GROSSO'|lei$UF=='MATO GROSSO DO SUL']='Centro-Oeste'
#lei$regiao[lei$UF=='ESPÍRITO SANTO'|lei$UF=='MINAS GERAIS'|lei$UF=='RIO DE JANEIRO'|lei$UF=='SÃO PAULO']='Sudeste'
#lei$regiao[lei$UF=='RIO GRANDE DO SUL'|lei$UF=='SANTA CATARINA'|lei$UF=='PARANÁ']='Sul'
#leiprodutividade=aggregate(lei[,c(3)],by=list(Regiao=lei$regiao,Ano=lei$Ano),mean,na.rm=T)
#para deixar a produtividade em litros por vaca por ano
#leiprodutividade$x=leiprodutividade$x*1000
#leiprodutividade=leiprodutividade[leiprodutividade$Ano>=1990,]
#setwd('/home/bmiyamoto/Documentos/Pesquisa/Artigo congresso de econometria espacial/Resultados - 2')
#write.csv(leiprodutividade,file='Evolução da produtividade de leite por região',row.names=F)


#Agora pego apenas as variáveis que me interessa da tabela dadosclimaanobr
clima=dadosclimaanobr[,c(1,4,7,10,12,18,20,21)]
clima=aggregate(clima[,c(3:7)],by=list(AMC=clima$NEW_CODE_1970_1997,Ano=clima$Ano),mean,na.rm=T)
clima=clima[clima$Ano>=1990,]


clima2=clima[,c(1:7)]
clima2$logtemp=log(clima2$`Temperatura Media`)
clima2$logtemp[!is.finite(clima2$logtemp)]=NA
clima2$logprec=log(clima2$`Precipitacao Total`)
clima2$logprec[!is.finite(clima2$logprec)]=NA
clima2$logsemchuva=log(clima2$semchuva)
clima2$logsemchuva[!is.finite(clima2$logsemchuva)]=NA
clima2$logmaisde25=log(clima2$maisde25mm)
clima2$logmaisde25[!is.finite(clima2$logmaisde25)]=NA
clima2$logdia1mm=log(clima2$dia1mmm4)
clima2$logdia1mm[!is.finite(clima2$logdia1mm)]=NA

amcuf=merge(AMC,mun5565,by.x=c('UFMUNDV'),by.y=c('Codigo'))
amcuf=amcuf[,c(2,4)]
amcuf=unique(amcuf)

milho=merge(milho,clima2,by=c('AMC','Ano'))
milho=merge(milho,amcuf,by.x=c('AMC'),by.y=c('NEW_CODE_1970_1997'),all.x=T,all.y=F)
nortemi=milho[milho$UF=='ACRE'|milho$UF=='AMAPÁ'|milho$UF=='AMAZONAS'|milho$UF=='PARÁ'|milho$UF=='RONDÔNIA'|milho$UF=='RORAIMA'|milho$UF=='TOCANTINS',]
nordestemi=milho[milho$UF=='ALAGOAS'|milho$UF=='BAHIA'|milho$UF=='CEARÁ'|milho$UF=='MARANHÃO'|milho$UF=='PARAÍBA'|milho$UF=='PERNAMBUCO'|milho$UF=='PIAUÍ'|milho$UF=='RIO GRANDE DO NORTE'|milho$UF=='SERGIPE',]
centromi=milho[milho$UF=='DISTRITO FEDERAL'|milho$UF=='GOIÁS'|milho$UF=='MATO GROSSO'|milho$UF=='MATO GROSSO DO SUL',]
sudestemi=milho[milho$UF=='ESPÍRITO SANTO'|milho$UF=='MINAS GERAIS'|milho$UF=='RIO DE JANEIRO'|milho$UF=='SÃO PAULO',]
sulmi=milho[milho$UF=='RIO GRANDE DO SUL'|milho$UF=='SANTA CATARINA'|milho$UF=='PARANÁ',]

library(plm)

###Milho
#Norte
nortemi=plm.data(nortemi)
ynortemi=cbind(nortemi[,c(4)])
xnortemi=as.matrix(nortemi[,c(10,11)])

nortemifd=plm(ynortemi ~ xnortemi,data=nortemi, model='fd')
summary(nortemifd)

#Nordeste
nordestemi=plm.data(nordestemi)
ynordestemi=cbind(nordestemi[,c(4)])
xnordestemi=as.matrix(nordestemi[,c(10,11)])

nordestemifd=plm(ynordestemi ~ xnordestemi,data=nordestemi, model='fd')
summary(nordestemifd)


#Centro-oeste
centromi=plm.data(centromi)
ycentromi=cbind(centromi[,c(4)])
xcentromi=as.matrix(centromi[,c(10,11)])

centromifd=plm(ycentromi ~ xcentromi,data=centromi, model='fd')
summary(centromifd)

#sudeste
sudestemi=plm.data(sudestemi)
ysudestemi=cbind(sudestemi[,c(4)])
xsudestemi=as.matrix(sudestemi[,c(10,11)])

sudestemifd=plm(ysudestemi ~ xsudestemi,data=sudestemi, model='fd')
summary(sudestemifd)


#sul
sulmi=plm.data(sulmi)
ysulmi=cbind(sulmi[,c(4)])
xsulmi=as.matrix(sulmi[,c(10,11)])

sulmifd=plm(ysulmi ~ xsulmi,data=sulmi, model='fd')
summary(sulmifd)


#mandioca

mandioca=merge(mandioca,clima2,by=c('AMC','Ano'))
mandioca=merge(mandioca,amcuf,by.x=c('AMC'),by.y=c('NEW_CODE_1970_1997'),all.x=T,all.y=F)
nortema=mandioca[mandioca$UF=='ACRE'|mandioca$UF=='AMAPÁ'|mandioca$UF=='AMAZONAS'|mandioca$UF=='PARÁ'|mandioca$UF=='RONDÔNIA'|mandioca$UF=='RORAIMA'|mandioca$UF=='TOCANTINS',]
nordestema=mandioca[mandioca$UF=='ALAGOAS'|mandioca$UF=='BAHIA'|mandioca$UF=='CEARÁ'|mandioca$UF=='MARANHÃO'|mandioca$UF=='PARAÍBA'|mandioca$UF=='PERNAMBUCO'|mandioca$UF=='PIAUÍ'|mandioca$UF=='RIO GRANDE DO NORTE'|mandioca$UF=='SERGIPE',]
centroma=mandioca[mandioca$UF=='DISTRITO FEDERAL'|mandioca$UF=='GOIÁS'|mandioca$UF=='MATO GROSSO'|mandioca$UF=='MATO GROSSO DO SUL',]
sudestema=mandioca[mandioca$UF=='ESPÍRITO SANTO'|mandioca$UF=='MINAS GERAIS'|mandioca$UF=='RIO DE JANEIRO'|mandioca$UF=='SÃO PAULO',]
sulma=mandioca[mandioca$UF=='RIO GRANDE DO SUL'|mandioca$UF=='SANTA CATARINA'|mandioca$UF=='PARANÁ',]

###Mandioca
#Norte
nortema=plm.data(nortema)
ynortema=cbind(nortema[,c(4)])
xnortema=as.matrix(nortema[,c(10,11)])

nortemafd=plm(ynortema ~ xnortema,data=nortema, model='fd')
summary(nortemafd)

#Nordeste
nordestema=plm.data(nordestema)
ynordestema=cbind(nordestema[,c(4)])
xnordestema=as.matrix(nordestema[,c(10,11)])

nordestemafd=plm(ynordestema ~ xnordestema,data=nordestema, model='fd')
summary(nordestemafd)


#Centro-oeste
centroma=plm.data(centroma)
ycentroma=cbind(centroma[,c(4)])
xcentroma=as.matrix(centroma[,c(10,11)])

centromafd=plm(ycentroma ~ xcentroma,data=centroma, model='fd')
summary(centromafd)

#sudeste
sudestema=plm.data(sudestema)
ysudestema=cbind(sudestema[,c(4)])
xsudestema=as.matrix(sudestema[,c(10,11)])

sudestemafd=plm(ysudestema ~ xsudestema,data=sudestema, model='fd')
summary(sudestemafd)


#sul
sulma=plm.data(sulma)
ysulma=cbind(sulma[,c(4)])
xsulma=as.matrix(sulma[,c(10,11)])

sulmafd=plm(ysulma ~ xsulma,data=sulma, model='fd')
summary(sulmafd)



#feijão

feijao=merge(feijao,clima2,by=c('AMC','Ano'))
feijao=merge(feijao,amcuf,by.x=c('AMC'),by.y=c('NEW_CODE_1970_1997'),all.x=T,all.y=F)
nortefj=feijao[feijao$UF=='ACRE'|feijao$UF=='AMAPÁ'|feijao$UF=='AMAZONAS'|feijao$UF=='PARÁ'|feijao$UF=='RONDÔNIA'|feijao$UF=='RORAIMA'|feijao$UF=='TOCANTINS',]
nordestefj=feijao[feijao$UF=='ALAGOAS'|feijao$UF=='BAHIA'|feijao$UF=='CEARÁ'|feijao$UF=='MARANHÃO'|feijao$UF=='PARAÍBA'|feijao$UF=='PERNAMBUCO'|feijao$UF=='PIAUÍ'|feijao$UF=='RIO GRANDE DO NORTE'|feijao$UF=='SERGIPE',]
centrofj=feijao[feijao$UF=='DISTRITO FEDERAL'|feijao$UF=='GOIÁS'|feijao$UF=='MATO GROSSO'|feijao$UF=='MATO GROSSO DO SUL',]
sudestefj=feijao[feijao$UF=='ESPÍRITO SANTO'|feijao$UF=='MINAS GERAIS'|feijao$UF=='RIO DE JANEIRO'|feijao$UF=='SÃO PAULO',]
sulfj=feijao[feijao$UF=='RIO GRANDE DO SUL'|feijao$UF=='SANTA CATARINA'|feijao$UF=='PARANÁ',]

###feijão
#Norte
nortefj=plm.data(nortefj)
ynortefj=cbind(nortefj[,c(4)])
xnortefj=as.matrix(nortefj[,c(10,11)])

nortefjfd=plm(ynortefj ~ xnortefj,data=nortefj, model='fd')
summary(nortefjfd)

#Nordeste
nordestefj=plm.data(nordestefj)
ynordestefj=cbind(nordestefj[,c(4)])
xnordestefj=as.matrix(nordestefj[,c(10,11)])

nordestefjfd=plm(ynordestefj ~ xnordestefj,data=nordestefj, model='fd')
summary(nordestefjfd)


#Centro-oeste
centrofj=plm.data(centrofj)
ycentrofj=cbind(centrofj[,c(4)])
xcentrofj=as.matrix(centrofj[,c(10,11)])

centrofjfd=plm(ycentrofj ~ xcentrofj,data=centrofj, model='fd')
summary(centrofjfd)

#sudeste
sudestefj=plm.data(sudestefj)
ysudestefj=cbind(sudestefj[,c(4)])
xsudestefj=as.matrix(sudestefj[,c(10,11)])

sudestefjfd=plm(ysudestefj ~ xsudestefj,data=sudestefj, model='fd')
summary(sudestefjfd)


#sul
sulfj=plm.data(sulfj)
ysulfj=cbind(sulfj[,c(4)])
xsulfj=as.matrix(sulfj[,c(10,11)])

sulfjfd=plm(ysulfj ~ xsulfj,data=sulfj, model='fd')
summary(sulfjfd)


#leite

leite=merge(leite,clima2,by=c('AMC','Ano'))
leite=merge(leite,amcuf,by.x=c('AMC'),by.y=c('NEW_CODE_1970_1997'),all.x=T,all.y=F)
nortel=leite[leite$UF=='ACRE'|leite$UF=='AMAPÁ'|leite$UF=='AMAZONAS'|leite$UF=='PARÁ'|leite$UF=='RONDÔNIA'|leite$UF=='RORAIMA'|leite$UF=='TOCANTINS',]
nordestel=leite[leite$UF=='ALAGOAS'|leite$UF=='BAHIA'|leite$UF=='CEARÁ'|leite$UF=='MARANHÃO'|leite$UF=='PARAÍBA'|leite$UF=='PERNAMBUCO'|leite$UF=='PIAUÍ'|leite$UF=='RIO GRANDE DO NORTE'|leite$UF=='SERGIPE',]
centrol=leite[leite$UF=='DISTRITO FEDERAL'|leite$UF=='GOIÁS'|leite$UF=='MATO GROSSO'|leite$UF=='MATO GROSSO DO SUL',]
sudestel=leite[leite$UF=='ESPÍRITO SANTO'|leite$UF=='MINAS GERAIS'|leite$UF=='RIO DE JANEIRO'|leite$UF=='SÃO PAULO',]
sull=leite[leite$UF=='RIO GRANDE DO SUL'|leite$UF=='SANTA CATARINA'|leite$UF=='PARANÁ',]

###leite
#Norte
nortel=plm.data(nortel)
ynortel=cbind(nortel[,c(4)])
xnortel=as.matrix(nortel[,c(10,11)])

nortelfd=plm(ynortel ~ xnortel,data=nortel, model='fd')
summary(nortelfd)

#Nordeste
nordestel=plm.data(nordestel)
ynordestel=cbind(nordestel[,c(4)])
xnordestel=as.matrix(nordestel[,c(10,11)])

nordestelfd=plm(ynordestel ~ xnordestel,data=nordestel, model='fd')
summary(nordestelfd)


#Centro-oeste
centrol=plm.data(centrol)
ycentrol=cbind(centrol[,c(4)])
xcentrol=as.matrix(centrol[,c(10,11)])

centrolfd=plm(ycentrol ~ xcentrol,data=centrol, model='fd')
summary(centrolfd)

#sudeste
sudestel=plm.data(sudestel)
ysudestel=cbind(sudestel[,c(4)])
xsudestel=as.matrix(sudestel[,c(10,11)])

sudestelfd=plm(ysudestel ~ xsudestel,data=sudestel, model='fd')
summary(sudestelfd)


#sul
sull=plm.data(sull)
ysull=cbind(sull[,c(4)])
xsull=as.matrix(sull[,c(10,11)])

sullfd=plm(ysull ~ xsull,data=sull, model='fd')
summary(sullfd)


