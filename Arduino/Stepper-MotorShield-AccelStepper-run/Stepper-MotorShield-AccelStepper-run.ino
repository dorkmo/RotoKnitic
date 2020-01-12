#include <AccelStepper.h>

AccelStepper stepper(2,12,13);

const int pwmA = 3;
const int pwmB = 11;
const int brakeA = 8;
const int brakeB = 9;

int switchStateForward = digitalRead(7);  

void setup()
{ 
 
  pinMode(pwmA, OUTPUT);
  pinMode(pwmB, OUTPUT);
  pinMode(brakeA, OUTPUT);
  pinMode(brakeB, OUTPUT);

  pinMode(7,INPUT_PULLUP);
   
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);
 
  stepper.setMaxSpeed(40);
  stepper.setSpeed(40);
  //stepper.runSpeed();
 
  stepper.setAcceleration(50);

  
}

void loop(){ 

  stepper.run();

}
