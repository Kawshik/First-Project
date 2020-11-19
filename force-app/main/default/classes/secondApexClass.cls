public with sharing class secondApexClass {
    private String greeting;
    private Integer a = 0;
    public secondApexClass() {
        firstApexClassForVisualPage f = new firstApexClassForVisualPage();
        this.greeting = f.getGreeting() + 'Again';
    }

    public String getGreeting(){
        return this.greeting;
    }

    public Integer getA(){
        return this.a;
    }

    public pageReference addition(){
        this.a = 1 + 1;
        return null;
    }
}
