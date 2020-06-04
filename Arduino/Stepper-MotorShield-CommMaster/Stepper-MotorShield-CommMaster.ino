#include <AccelStepper.h>

AccelStepper stepper(2,12,13);

//pins used 3,5,6,8,9,11,12,13,A0,A1

const int pwmA = 3;
const int pwmB = 11;
const int brakeA = 9;
const int brakeB = 8;

const int rxWait = 5;
const int txDone = 6;

int waiting = 0;

int switchStateForward = digitalRead(7);  

void setup()
{ 

 
  pinMode(pwmA, OUTPUT);
  pinMode(pwmB, OUTPUT);
  pinMode(brakeA, OUTPUT);
  pinMode(brakeB, OUTPUT);
  pinMode(rxWait, INPUT);
  pinMode(txDone, OUTPUT);
 
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);


 
  stepper.setMaxSpeed(120);
  stepper.setSpeed(110);
 
  stepper.setAcceleration(80);
  stepper.moveTo(999999999);
 
 
}

void loop(){ 

  if (stepper.distanceToGo() == 0) {
    stepper.run();                   // let the AccelStepper to disable motor current after stop
    delay(2000);                     // wait 2 sec in final position
    stepper.moveTo(-stepper.currentPosition());
  }
  stepper.run();

  if(switchStateForward == HIGH){
  stepper.stop();
  }
    
  }
