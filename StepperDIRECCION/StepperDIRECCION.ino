//This is a code for a shaker
/*Instructions form http://www.instructables.com/id/ARDUINO-UNO-TB6560-Stepper-motor-driver /*/
/*Code from http://www.schmalzhaus.com/EasyDriver/Examples/Ea... */

//SHAKER de BACTERIAS lateral
//Las bacterias en medio líquido (lo que será nuestra tinta) les gusta estar en continuo movimiento y pegadas al calor 
//generado por los motores de la maquina. Por ello hemos construido un disco acoplado al  eje del motor, que cambiara de 
//direccion cada cuarto de vuelta aprox.


int Distance = 0; // Record the number of steps we've taken 

void setup() {

pinMode(8, OUTPUT);

pinMode(9, OUTPUT);


digitalWrite(8, LOW);

digitalWrite(9, LOW);

}

void loop() {

digitalWrite(9, HIGH);

delayMicroseconds(100);

digitalWrite(9, LOW);

delayMicroseconds(100);

Distance = Distance + 1; // record this step // Check to see if we are at the end of our move

// two rotation for 1/8 bridge and 1 rotation for 1/6 bridge (for this code)

if (Distance == 1600) { // We are! Reverse direction (invert DIR signal)

if (digitalRead(8) == LOW) {

digitalWrite(8, HIGH); }

else {

digitalWrite(8, LOW);

} // Reset our distance back to zero since we're // starting a new move

Distance = 0; // Now pause for half a second delay(500);

}

}


