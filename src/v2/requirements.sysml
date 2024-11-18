package 'Vehicle Requirements' {
    import ScalarValues::*;
    
    requirement def VehicleRequirements {
        doc /* Top level vehicle requirements */
        
        requirement performance {
            doc /* The vehicle shall meet performance targets */
            
            requirement acceleration {
                id = "REQ-1.1.1";
                doc /* Vehicle shall accelerate 0-60 mph in < 6 sec */
                
                attribute maxTime : Real = 6;
                
                require constraint {
                    actualTime <= maxTime
                }
                
                verify by AccelerationTest;
            }
            
            requirement topSpeed {
                id = "REQ-1.1.2";
                doc /* Vehicle shall achieve top speed of 155 mph */
                
                attribute minSpeed : Real = 155;
                
                require constraint {
                    actualSpeed >= minSpeed
                }
            }
        }
        
        requirement fuelEfficiency {
            doc /* The vehicle shall meet efficiency targets */
            
            requirement highwayMPG {
                id = "REQ-1.2.1";
                doc /* Vehicle shall achieve 30 mpg highway */
                
                attribute minMPG : Real = 30;
                
                require constraint {
                    actualMPG >= minMPG
                }
            }
        }
    }
    
    case def AccelerationTest {
        subject vehicle : Vehicle;
        
        objective {
            doc /* Verify acceleration requirement */
        }
        
        return verdict : VerdictKind;
    }
}