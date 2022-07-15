@IsTest
public with sharing class MyCrConTest {
    @IsTest
    public static void MyCrConTest() {

        Contact con1 = new Contact(lastname='vscodeGitintegrationTest', email='test@gmail.com');
        insert con1;

   

Test.startTest();
con1.email='zhkushtarbek@gmail.com';
update con1;
Test.stopTest();


System.assertEquals('zhkushtarbek@gmail.com',con1.email);

        }

    }

