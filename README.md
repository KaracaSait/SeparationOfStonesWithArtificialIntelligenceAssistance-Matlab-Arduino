# SeparationOfStonesWithArtificialIntelligenceAssistance-Matlab-Arduino

When using an Arduino Uno, a continuous variable sound wave is generated between 300 Hz and 1000 Hz through a buzzer when the switch is activated. A second Arduino Uno and a sound detection sensor are used to measure the frequency of the incoming sound wave. With the help of Matlab, the measured sound frequencies are recorded in an Excel file.

The purpose of the project created using Arduino Uno, Arduino IDE, and Matlab is to differentiate between Oltu Stone and Russian Stone by sending sound waves at different frequencies, measuring the frequency of the sound wave using the stones' sound permeability, and creating a data file. Artificial intelligence is then used to classify the created data. This allows for the prediction of whether the test stone is Oltu Stone or Russian Stone. However, in order for artificial intelligence to classify, it is necessary to have a data file (S_DATA) that contains the known frequencies transmitted by Oltu Stone and Russian Stone. Therefore, before asking the program to predict the test stone, the S_DATA dataset must be created.

To do this, measurements were first taken and recorded from 30 different Oltu Stones, with 10 measurements each, totaling 300 measurements. The same process was carried out for Russian Stone. The created dataset was prepared for loading into the program for training purposes. After loading S_DATA into the program, the final step before the program is ready is to split the data into Training and Test sets in the proportions of 80% and 20% respectively to see if the program memorizes and how consistent the results are.

The last step before the program becomes operational is to train the program with the Training data and then make predictions on the Test data to see how accurate the predictions are. If the Test results are as desired, the program is considered ready for use.

To create S_DATA, measurements were taken for stones other than the ones used to create the dataset, and the results (Eg) were recorded. Then, Eg is compared with S_DATA to determine whether the unknown test stone is Oltu Stone or Russian Stone. Two classifiers are used for the classification process. After the classification process is completed, if both classifiers make the same decision, the test stone's identity is displayed on the MATLAB screen. However, in case the classifiers make different decisions, the program requests another measurement.

### After programming Arduino Uno 1 and Arduino Uno 2, the circuit connections were made as shown below. In order for Arduino Uno 2 (on the right) to be able to transfer data to the computer, it must be connected to the computer via the USB port.

![arduinoConnect](https://github.com/KaracaSait/SeparationOfStonesWithArtificialIntelligenceAssistance-Matlab-Arduino/assets/141579460/8cc2379d-8074-408f-bad5-6cee0f0499ff)

## Steps Taken to Create the Data Set During the Project:

Arduino Uno 1 was coded using Arduino IDE to generate a continuous variable sound wave between 300 Hz and 1000 Hz using a buzzer when the switch is activated.

Arduino Uno 1, also coded using Arduino IDE, displays "Ready For Analysis" on the LCD screen before the switch is activated and displays "Data Analyzing.." on the LCD screen during the time when the sound wave is generated with the buzzer.

Arduino Uno 2, coded using Arduino IDE, performs approximately 15 seconds of a total of 120 frequency measurements with the help of a sound detection sensor when the switch is activated and prints these measurements to the serial monitor.

To enable serial communication between Arduino Uno 2 and Matlab, the Arduino Hardware extension is installed in Matlab, allowing Arduino Uno 2 to send measurement results to Matlab.

With the program written in Matlab, measurements sent by Arduino Uno 2 are saved in an Excel file through Matlab, creating a data set named "S_DATA".

When creating S_DATA, the first 30 stones are Oltu Stones, and 10 different measurements are taken for each stone. Therefore, the label "1" is written in the 121st column as a tag for the first 300 rows of data. The last 30 stones are Russian Stones, and 10 different measurements are taken for each stone. Therefore, the label "2" is written in the 121st column as a tag for data rows 301-600.

## Steps Taken to Train with Artificial Intelligence during the Project:

The created data set (S_DATA) is loaded from an Excel file into Matlab.

S_DATA data is divided into 80% for training and 20% for testing.

Training data is loaded into the program, success rate is calculated using artificial intelligence, and a classifier is selected.

The program is asked to predict with test data, and prediction results are compared with test results to determine the success rate.

To improve the program's success rate, the two classifiers with the highest success rate are selected.

If the results are deemed suitable, the program is considered to have successfully completed training and is ready for use.

## Steps Taken to Distinguish Oltu Stone and Russian Stone with Artificial Intelligence during the Project:

Arduino Uno 1 was coded using Arduino IDE to generate a continuous variable sound wave between 300 Hz and 1000 Hz using a buzzer when the switch is activated.

Arduino Uno 1, also coded using Arduino IDE, displays "Ready For Analysis" on the LCD screen before the switch is activated and displays "Data Analyzing.." on the LCD screen during the time when the sound wave is generated with the buzzer.

Arduino Uno 2, coded using Arduino IDE, performs approximately 15 seconds of a total of 120 frequency measurements with the help of a sound detection sensor when the switch is activated and prints these measurements to the serial monitor.

To enable serial communication between Arduino Uno 2 and Matlab, the Arduino Hardware extension is installed in Matlab, allowing Arduino Uno 2 to send measurement results to Matlab.

With the program written in Matlab, measurements sent by Arduino Uno 2 are saved in an Excel file through Matlab, creating a data set named "Eg".

Using artificial intelligence, the "Eg" data set created is compared with the "S_DATA" data set used for training earlier to perform the prediction process.

If both classifiers make the same prediction, "Oltu Taşı" or "Rus Taşı" is displayed on the Matlab screen. However, if the classifiers make different predictions, "Lütfen Tekrar Ölçüm Yapınız" is displayed.
