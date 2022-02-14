######################################################################
##########Modelo de dado em painel com base nos dados não clusterizados
#Biblioteca para trabalhar com dados em painel
library(plm)

#Depois de carregar a biblioteca tenho que definir quais são as variáveis e
#qual é a variável dependente. Essas variáveis serão separadas em vetores colunas diferentes

#Minha variável dependente é produtividade
Y=cbind(milho[,c(3)])

#Minhas variáveis dependentes iniciais 
X=cbind(milho$C2,milho$C3,milho$C4,milho$C5)

#Agora define-se o painel, a unidade de corte transversal e o tempo
pdata=plm.data(milho[,c(1,2)], c("AMC","Ano"))

#Rodar modelo de dados empilhados
milhopooled=plm(Y ~ X,data=pdata, model="pooling")
summary(milhopooled)

#Rodar modelo between
milhobetween=plm(Y ~ X, data=pdata, model="between")
summary(milhobetween)

#Rodar modelo de primeira diferenças
milhopd=plm(Y ~ X, data=pdata, model="fd")
summary(milhopd)

#Rodar modelo de efeitos fixos ou within
milhofix=plm(Y ~ X, data=pdata, model="within")
summary(milhofix)

#Rodar modelo de efeitos aleatórios
milhorandom=plm(Y ~ X, data=pdata, model="random")
summary(milhorandom)

#Teste para empilhados x efeitos aleatórios. Não sei interpretar esse teste
plmtest(milhopooled)

#Teste para empilhados x efeitos fixos
pFtest(milhofix,milhopooled)

#Teste de Hausman. Efeitos fixos x efeitos aleatórios
phtest(milhorandom, milhofix)