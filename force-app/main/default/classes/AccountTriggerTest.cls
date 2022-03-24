@isTest
public class AccountTriggerTest { 
   //teste 1 - criar uma conta com tarefa
    @isTest
    static void AccountTriggerTest() {
        Account accountObj = new Account();
        accountObj.Name = 'teste 1';
        accountObj.Ownership = 'Private';

        insert accountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE whatId = :accountObj.Id AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(taskList.size(),1);
    }
    //teste2 criar uma conta sem tarefa
    @isTest
    static void contaSemTarefa(){
        Account accountObj = new Account();
        accountObj.Name = 'teste 1';
        accountObj.Ownership = '';

        insert accountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE whatId = :accountObj.Id AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(taskList.size(),0);

    }

    //teste 3 massa de dados grande
    @isTest
    static void contaMassaDados(){
        
        List<Account> accountList = new List<Account>();
        for(Integer i = 1; i<=100; i++){

            Account accObj = new Account();
            accObj.Name = 'Conta'+i;
            accObj.Ownership = 'Private';
            accObj.Phone = '32536';

            accountList.add(accObj);
        }

        insert accountList;

        list<Task> tasksList = new List<Task>([SELECT Id FROM Task WHERE WhatId IN :accountList AND Subject = 'Verificar dados das contas']);

        System.AssertEquals(tasksList.size(), 100);

}


}

   