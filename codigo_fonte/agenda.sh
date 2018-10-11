#!/bin/bash

#Este codigo foi feito por Ademar cardoso.
#@teckthor no GitHub

#Adicionar_Contato
add(){
clear
echo "[__________Adicionar Contato __________]"
	echo ""
	echo "     Nome Completo: "; read nome
	echo "     Telefone: "; read tel
	echo "     Celular: "; read cel
	echo "     Aniversario"
	echo "     Dia: "; read dia
	echo "     Mes: "; read mes
	echo ""
	echo $nome"-"$tel"-"$cel"-"$dia"/"$mes >> agenda.txt
	echo ""
	echo "Contato Adicionado Com Sucesso"
	sleep 1
}

#Atualizar_Contato
atualizar(){
clear
	echo "[__________Atualizar Contato__________]"
	echo ""
		cat agenda.txt | cut -d"-" -f1
	echo "     Digite um contato para atualizar: "
	read nomea
	echo ""
	echo "     Tem certeza que deseja alterar `grep -i $nomea agenda.txt`?(s/n)"
	read confirm
	if [ $confirm = "s" -o $confirm = "S" ]; then
		echo ""
		echo "     O que voce gostaria de fazer? "
		echo " 1 - Mudar nome"
		echo " 2 - Mudar Telefone"
		echo " 3 - Mudar Celular"
		echo " 4 - Mudar Data de Aniversario"
		read opc

		case $opc in
			1)echo "     Novo Nome: "; read nome
			na=`grep -i $nomea agenda.txt | cut -d"-" -f1`
			sed -i "/^$nomea/s/$na/$nome/" agenda.txt
			;;
			2)echo "     Novo Telefone: "; read tel
			nt=`grep -i $nomea agenda.txt | cut -d"-" -f2`
			sed -i "/^$nomea/s/$nt/$tel/" agenda.txt
			;;
			3)echo "     Novo Celular: "; read cel
			nc=`grep -i $nomea agenda.txt | cut -d"-" -f3`
			sed -i "/^$nomea/s/$nc/$cel/" agenda.txt
			;;
			4)echo "     Mes: "; read mes
			ma=`grep -i $nomea agenda.txt | cut -d"/" -f2`
			sed -i "/^$nomea/s/$ma/$mes/" agenda.txt
			;;
		esac
	echo "Atualizacao Feita"
	sleep 1

	fi

}

#Excluir_Contato
excluir(){
clear
	echo "[__________Excluir Contato__________]"
	echo ""
		cat agenda.txt
	read -p "     Digite o nome do contato a ser deletado: " nomed
	echo "     Tem certeza que deseja excluir `cat agenda.txt| grep -i $nomed`? (s/n)"
	read confirma
	if [ $confirma = "s" -o $confirma = "S" ]; then
	grep -i $nomed agenda.txt >> rec.txt
	sed -i -e "/$nomed/d" agenda.txt
	echo "Contato Excluido"
	fi

}
#Recuperar_Contato
recuperar(){
clear
	echo "[__________Recuperar Contato __________]"
	echo ""
	echo "     Qual contato deseja recuperar?"
	echo ""
	echo "`cat rec.txt`"
	echo ""
	read -p "->" nomer
	echo "     Tem certeza que deseja recuperar `cat rec.txt| grep -i $nomer`? (s/n)"
	read confirma
	if [ $confirma = "s" -o $confirma = "S" ]; then
	grep -i $nomer rec.txt >> agenda.txt
	sed -i -e "/$nomer/d" rec.txt
	echo "Contato Recuperado!"
	fi

}

#Ordernar_Contato
ordenar(){
sort -o agenda.txt agenda.txt
echo "Agenda Ordenada :)"
sleep 2
}
#Listar
listar(){
clear
	echo ""
	echo "[__________Listar Contatos__________]"
	echo ""
	echo " Contatos salvos na Agenda:"
	echo ""
	cat agenda.txt
sleep 5
}


#Menu_Principal
while true
do
clear
	echo ""
	echo "[__________Agenda de Contatos__________]"
	echo ""
	echo "1 - Adicionar Contatos"
	echo "2 - Alterar Contatos"
	echo "3 - Excluir Contatos"
	echo "4 - Recuperar Contatos"
	echo "5 - Ordenar Contatos"
	echo "6 - Listar Csntatos"
	echo "7 - SAIR"
	read opc

case $opc in
	1)add;;
	2)atualizar;;
	3)excluir;;
	4)recuperar;;
	5)ordenar;;
	6)listar;;
	7)exit 0
esac
done

