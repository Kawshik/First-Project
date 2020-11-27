@IsTest
public class ApexAdditionTest {
    @isTest
    static void testAddMethodPositive() {
        ApexAddition a = new ApexAddition();
        Integer add = a.add(1, 2);
        System.assertEquals(3, add, 'Wrong Result');
    }

    @isTest
    static void testAddMethodNegative() {
        ApexAddition a = new ApexAddition();
        Integer add = a.add(1, 2);
        System.assertNotEquals(2, add, 'Wrong Result');
    }
}
