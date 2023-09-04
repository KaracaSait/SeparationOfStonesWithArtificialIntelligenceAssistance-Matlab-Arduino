#include "arduinoFFT.h"
#define SAMPLES 128             
#define SAMPLING_FREQUENCY 2048 
arduinoFFT FFT = arduinoFFT();
unsigned int samplingPeriod;
unsigned long microSeconds;
double vReal[SAMPLES]; 
double vImag[SAMPLES]; 
int buttonPin= 10;
void setup() 
{
    Serial.begin(9600); 
    samplingPeriod = round(1000000*(1.0/SAMPLING_FREQUENCY)); 
    pinMode(buttonPin,INPUT_PULLUP);
}
void loop() 
{  
  int buttonState=digitalRead(buttonPin);
  if (buttonState == LOW){
    delay(1000);
    for(int x=1;x<=120;x++){
    for(int i=0; i<SAMPLES; i++)
    {
        microSeconds = micros(); 
        vReal[i] = analogRead(5); 
        vImag[i] = 0;
        while(micros() < (microSeconds + samplingPeriod))
        {
        }
    }
    FFT.Windowing(vReal, SAMPLES, FFT_WIN_TYP_HAMMING, FFT_FORWARD);
    FFT.Compute(vReal, vImag, SAMPLES, FFT_FORWARD);
    FFT.ComplexToMagnitude(vReal, vImag, SAMPLES);
    double peak = FFT.MajorPeak(vReal, SAMPLES, SAMPLING_FREQUENCY);
    Serial.println(peak);     
    }
  }
}