package VehicleBehavior {
    state def VehicleStates {
        entry state off;
        
        state running {
            entry state idle;
            
            state moving {
                state accelerating;
                state cruising;
                state braking;
                
                transition accelerating to cruising when targetSpeedReached;
                transition cruising to braking when brakePedalPressed;
                transition braking to accelerating when acceleratorPressed;
            }
            
            transition idle to moving.accelerating when acceleratorPressed;
            transition moving to idle when vehicleStopped;
        }
        
        transition off to running.idle when ignitionOn if fuelAvailable;
        transition running to off when ignitionOff;
        
        // State behaviors
        state action off {
            exit action disengageParking;
        }
        
        state action running {
            entry action startEngine;
            do action monitorSystems;
            exit action shutdownEngine;
        }
        
        // Event definitions
        event ignitionOn;
        event ignitionOff;
        event acceleratorPressed;
        event brakePedalPressed;
        event targetSpeedReached;
        event vehicleStopped;
    }
    
    part vehicle {
        exhibit state vehicleStates : VehicleStates;
    }
}