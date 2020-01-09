#include <AccelStepper.h>

AccelStepper stepper(2,12,13);

const int pwmA = 3;
const int pwmB = 11;
const int brakeA = 8;
const int brakeB = 9;


void setup()
{ 
 
  pinMode(pwmA, OUTPUT);
  pinMode(pwmB, OUTPUT);
  pinMode(brakeA, OUTPUT);
  pinMode(brakeB, OUTPUT);
 
  digitalWrite(pwmA, HIGH);
  digitalWrite(pwmB, HIGH);
  digitalWrite(brakeA, LOW);
  digitalWrite(brakeB, LOW);
 
  stepper.setMaxSpeed(120);
  stepper.setSpeed(120);
 
  stepper.setAcceleration(50);
  stepper.moveTo(1200);
 
 
}

void loop(){ 

  if (stepper.distanceToGo() == 0) {
    stepper.run();                   // let the AccelStepper to disable motor current after stop
    delay(2000);                     // wait 2 sec in final position
    stepper.moveTo(-stepper.currentPosition());
  }
  stepper.run();

}
