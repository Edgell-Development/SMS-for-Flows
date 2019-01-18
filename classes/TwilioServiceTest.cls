@isTest
public with sharing class TwilioServiceTest {
    
    static testMethod void testMethod1() {
        Test.startTest();
        List<TwilioMessage> messageList = new List<TwilioMessage>();
        TwilioMessage msg = new TwilioMessage();
        msg.toNumber = '5555555555';
        msg.messageBody = 'Test Message';
        messageList.add(msg);
        Test.setMock(HttpCalloutMock.class, new TwilioMockHttpResponse());
        List<TwilioMessageResponse> responseList = new List<TwilioMessageResponse>();
        responseList = TwilioService.sendTwilioMessage(messageList);
        system.assertEquals(responseList.isEmpty(), false);
        Test.stopTest();
    }

    @TestSetup static void createTestData() {
        TwilioCredentials__c creds = new TwilioCredentials__c();
        creds.API_Key__c = 'ASFDAFAFAFAFDA';
        creds.API_Secret__c = 'AFSDAFDASFAFDAFDA';
        insert creds;
    }
}