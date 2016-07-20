#include <stdio.h>

#include "PID_v1.h"

//Define Variables we'll be connecting to
double Setpoint, Input, Output;

//Specify the links and initial tuning parameters
double Kp=0.5, Ki=0, Kd=0;

PID myPID(&Input, &Output, &Setpoint, Kp, Ki, Kd, DIRECT);

unsigned long millis(void)
{
	static unsigned long time = 0;

	time+=6;
	return time;
}

int main(int argc, char **argv)
{
	myPID.SetTunings(Kp, Ki, Kd);
	myPID.SetSampleTime(5);
	myPID.SetOutputLimits(0, 1024);
	myPID.SetMode(AUTOMATIC);
	do{
		//read Input
		scanf("%lf", &Input);
		printf("Input = %lf\n", Input);
		Setpoint = 100;
		myPID.Compute();
		//write Output
		printf("Output = %lf\n", Output);
	}while(1);
	return 0;
}

