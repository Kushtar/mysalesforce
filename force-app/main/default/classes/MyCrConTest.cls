@IsTest
public with sharing class MyCrConTest {
    @IsTest
    public static void MyCrConTest() {
        Contact con1 = new Contact(lastname='Hello', email='test@gmail.com');
        insert con1;
        con1.email='zhkushtarbek@gmail.com';
        
        Test.startTest();
        update con1;
        Test.stopTest();

        System.assertEquals('zhkushtarbek@gmail.com',con1.email);


        }
        @IsTest

        public static void MyCrConTestNegitive() {
            Contact con2 = new Contact(lastname='Hello', email='test@gmail.com');
            insert con2;
            con2.email=null;
            Boolean status = true;
            Test.startTest();
            try{
                update con2;
            }catch (Exception e){
                status=false;
            }
        
            Test.stopTest();
    
            System.assertEquals(false, status);
    
    
            }
    }

