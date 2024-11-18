package VehicleSystem {
    import ScalarValues::*;
    
    part def Vehicle {
        // Attributes
        attribute mass : Real;
        attribute speed : Real;
        attribute position : Real;
        
        // Parts
        part engine : Engine;
        part transmission : Transmission;
        part wheels : Wheel[4];
        
        // Ports
        port powerPort : PowerPort;
        
        // Constraint
        assert constraint acceleration { 
            acceleration = power/(mass*speed)
        }
        
        // Interface connections
        interface enginePower connect engine.powerOut to transmission.powerIn;
        interface wheelDrive connect transmission.powerOut to wheels.powerIn;
    }
    
    part def Engine {
        attribute power : Real;
        attribute rpm : Real;
        attribute fuelConsumption : Real;
        
        port powerOut : PowerPort;
        port fuelIn : ~FuelPort;  // Conjugated port
    }
    
    part def Transmission {
        attribute gearRatio : Real;
        attribute efficiency : Real;
        
        port powerIn : ~PowerPort;
        port powerOut : PowerPort[4];
    }
    
    part def Wheel {
        attribute diameter : Real;
        attribute friction : Real;
        
        port powerIn : ~PowerPort;
    }
    
    port def PowerPort {
        attribute torque : Real;
        attribute speed : Real;
        
        in item flow power;
    }
}