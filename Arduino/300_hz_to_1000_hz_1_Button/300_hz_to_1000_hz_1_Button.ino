#include <LiquidCrystal.h>
int buzzerPin=9;
int buttonPin=10;
LiquidCrystal lcd(12,11,5,4,3,2);
void setup() {
  pinMode(buzzerPin,OUTPUT);
  pinMode(buttonPin,INPUT_PULLUP);
  lcd.begin(16,2);
  lcd.setCursor(0,0);
  lcd.print("Ready For");
  lcd.setCursor(0,1);
  lcd.print("Analysis");
}
void loop() {
  int buttonState=digitalRead(buttonPin);
  if (buttonState == LOW){
    delay(1000);
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Data Analyzing..");
    for (int x=0;x<=36;x++){
    tone(buzzerPin,sin(x*10)*350+650);delay(500);noTone(buzzerPin);
    }
    lcd.clear();
  }  
  else{
    noTone(buzzerPin);
    lcd.setCursor(0,0);
    lcd.print("Ready For");
    lcd.setCursor(0,1);
    lcd.print("Analysis");
  }
}
