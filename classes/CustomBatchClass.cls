public class CustomBatchClass implements Database.Batchable<SObject>, Database.Stateful,Database.AllowsCallouts {
          public string query;
          public integer count = 0;
    
    public CustomBatchClass(){
        this.query = 'SELECT Id,Rating from Account';
    }
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
     public void execute(Database.BatchableContext BC,List<Account> scope){
         try{ 
         for(account acc: scope){
             acc.Rating = 'Warm';
             count++;
             //System.debug(count);
         }
         update scope;
         } catch(Exception e){
             System.debug(e.getMessage());
         }      
    }
     public void finish(Database.BatchableContext BC){
        //return Database.getQueryLocator(query);
        System.debug(count);
         System.debug('MB');
    }
}