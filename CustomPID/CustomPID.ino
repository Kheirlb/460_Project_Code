// AE 460 Fire Watch: Flight Model ADCS Code
// Demonstrates yaw control using P gain.
// Authors: Karl Parks, Schon Siguenza, Jewar Doski, Ewald Polifrone, Stephan Paesseler

//Adafruit IMU Libraries
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

Adafruit_BNO055 bno = Adafruit_BNO055(55);

//Includes required to use Roboclaw library
#include <SoftwareSerial.h>
#include "RoboClaw.h"

#define address1 0x80
#define address2 0X81

//See limitations of Arduino SoftwareSerial
SoftwareSerial serial(10,11);
RoboClaw roboclaw(&serial,10000);

//Define Variables we'll be connecting to
double Setpoint_x, Input_x, Output_x;
double Setpoint_y, Input_y, Output_y;
double Setpoint_z, Input_z, Output_z;

//PID constants, same gains used for each axis
double kp = -5; //P Gain
double ki = 0;  //I Gain
double kd = 0;  //D Gain

//motor and angle values
int maxSat = 125; //max saturation for motor thottle, range between 0-127
int closeEnough = 10; //degrees off of set point before motor controller activates
int minSat = 20; //minimum saturation, motors are weak and friction of ball bearing prevented...
//ability of small acceleration changes to rotate heavy flight model

//variables for PID controller
unsigned long currentTime, previousTime;
double elapsedTime;
double error;
double lastError;
double cumError, rateError;

//roboclaw uses direction functions, therefore we required a boolean for negative error
bool isForward = true;

void setup(){
  //start serial information sent to raspberry pi OBC
  Serial.begin(9600);
  Serial.println("Orientation Sensor Test"); Serial.println("");

  /* Initialise the sensor */
  if(!bno.begin())
  {
    /* There was a problem detecting the BNO055 ... check your connections */
    Serial.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
    while(1);
  }

  delay(1000);

  bno.setExtCrystalUse(true);
  //Open roboclaw serial ports
  roboclaw.begin(38400);

  //read initial IMU data
  sensors_event_t event;
  bno.getEvent(&event);

  Setpoint_x = event.orientation.x; //sets the 0 of setpoint to first read value of IMU
  Setpoint_y = 0;
  Setpoint_z = 0;
}

// Functions to calculate attitude error. Intput is the setpoint angle and a attitude between 0-360 degrees
// Returns values adjusted so maximum absolute error is 1 pi, from -180 to +180 degrees
double calcError(double setpoint, double input) {
  double error = setpoint - input;
   if (error < -180) {
      error = error +360;
   }
   else if (error > 180)  {
    error = error - 360;
   }
   return error;
}

// Compute PID function
// Source: https://www.teachmemicro.com/arduino-pid-control-tutorial/
// Integral and Derivate PID controler lines commented out for ease of P gain implementation
double computePID(double inp){
//  currentTime = millis();                //get current time
//  elapsedTime = (double)(currentTime - previousTime);        //compute time elapsed from previous computation

  error = calcError(Setpoint_x, inp);
//  cumError += error * elapsedTime;                // compute integral
//  rateError = (error - lastError)/elapsedTime;   // compute derivative

  double out = kp*error;
//  double out = kp*error + ki*cumError + kd*rateError;                //PID output
//
//  lastError = error;                                //remember current error
//  previousTime = currentTime;                        //remember current time

  return out;                                        //have function return the PID output
}

void loop(){
  Serial.flush(); //clear the buffer
  //adafruit imu Void stuff
    /* Get a new sensor event */
  sensors_event_t event;
  bno.getEvent(&event);

  /* Display the floating point data */
  Serial.print("Z: "); //the z-axis of our satellite actually uses the x attitude sensor because the IMU is mounted on the side
  Serial.print(event.orientation.x, 4);
//  Serial.print("\tZdot: ");
//  Serial.print(event.velocity.x, 4);
  Serial.print("\tSetpoint: ");
  Serial.print(Setpoint_x, 4);
//  Serial.print("\tY: ");
//  Serial.print(event.orientation.y, 4);
//  Serial.print("\tZ: ");
//  Serial.print(event.orientation.z, 4);

  //IMU rate reading using gryo
  imu::Vector<3> gyro = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
  Serial.print("\tGryo_X: ");
  Serial.print(gyro.x(), 4);

  Input_x = event.orientation.x;
  Output_x = computePID(Input_x);
  delay(50);

  //check forward or backward
  if (Output_x < 0) {
    isForward = false;
    Output_x = -Output_x;
  }
  else {
    isForward = true;
  }

  //check saturation "max value"
  if (Output_x > maxSat) {
    Output_x = maxSat;
  }

  //checks if error is clone enough to setpoint
  if (Output_x < minSat && Output_x > closeEnough) {
    Output_x = minSat;
  }

  Serial.print("\tOutput: ");
  Serial.print(Output_x);
  //control motors
  if (isForward) {
    Serial.print("\tForward: ");
    roboclaw.ForwardM2(address1,Output_x);
    Serial.print(Output_x);
  }
  else {
    Serial.print("\tBackward: ");
    roboclaw.BackwardM2(address1,Output_x);
    Serial.print(Output_x);
  }
  Serial.println();

  //below code utlizes the gryo as a method to ensure if acceleration is 0 even at full speed
  //function needs some work
  /*if (abs(gyro.x()) < 0.5 && Output_x > closeEnough) {
    roboclaw.BackwardM2(address1,0);
    Serial.println("\nReset");
    delay(500);*/
}
