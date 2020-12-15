#ifndef _PID_LIB_H_
  #define _PID_LIB_H_

class PID_lib {
  public:
    double sample, lastSample;
    double error;
    
    double kP, kI, kD;
    double setPoint;
    
    double P, I, D, PID;
    
    long lastProcess;
  
    PID_lib(double _kP, double _kI, double _kD) {
      kP = _kP;
      kI = _kI;
      kD = _kD;
    }
  
    void addNewSample(double _sample) {
      sample = _sample;
    }
  
    void setSetPoint(double _setPoint) {
      setPoint = _setPoint;
    }
  
    double process(void) {
      // Error
      error = setPoint - sample;
      
      double deltaTime = (millis() - lastProcess) / 1000.0;
      lastProcess = millis();
      
      // P
      P = error * kP;
      
      // I
      I = I + (error * kI) * deltaTime;
      
      // D
      D = (lastSample - sample) * kD / deltaTime;
      lastSample = sample;
      
      // PID
      PID = P + I + D;
        
      return PID;
    }
};

#endif /*_PID_LIB_H_*/
