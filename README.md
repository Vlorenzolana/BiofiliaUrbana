# BiofiliaUrbana
Residency Interactivos?16 MediaLabPrado Madrid
Una investigación de la micro-fauna y flora del entorno urbano, que se centrará en estudiar las conexiones entre los entornos urbanos, el mapeo de datos, organismos vivos y electro-informática. Consiste en un hackeo de impresora 3D para imprimir en 2D.


HOW TO RUN A BIOPRINTER

FIND A MAKERBOT 
This documentation is for: MakerBot Thing-O-Matic (2010) with a Arduino ATMega 1280, a MightyBoard v2.4 and a ECB 3.6.

REPLACE the Step Motor of the plastic wheel with this: https://www.ebay.co.uk/itm/12V-24V-Peristaltic-Pump-Dosing-Pump-42-Stepper-Motor-Tubing-Hose-Pump-Lab-/152485216708

DOWNLOAD REPLICATORG 0040
  - http://replicat.org/
  
DOWNLOAD PROCESSING
  -  https://processing.org/
  
MAKE SQUARE PETRIDISHES WITH LB MEDIUM 
(for example: Sigma-Aldrich, plastic, L × W   	120 mm × 120 mm, dish H 16 mm or rounded glass Out Diameter O.D. 200 mm, H 20 mm, autoclavable ) 
  - DIY LB MEDIUM AGAR RECIPE: 52,5 gr beef powder (for example: Knorr meat soup cubes) 1 litre water, 21 gr sugar, 37,5 gr agar, put mix in yogurt crystal jars, fill 1/3 of each jar with the mix, put aluminium paper or cover it with cap WITHOUT CLOSING!, fill the bottom with 2 fingers water, put a grid that fits into the pressure cooker or fill the space with textiles (to make sur that they do not fall, also they should not absorb all the water on the bottom completely), heat for 15-20 minutes from the moment the pressure hits the top) Successfully grown: M.Luteus, M.Aurantica, M. Roseus (yellow, orange, pink bacteria)

DESIGN IN PROCESSING 
Run processing Code
(your background photo should be saved into the folder --> "data" inside your processing algorythm folder)

SET UP REPLICATOR
We are working on a MakerBot Thing-O-Matic (2010) with a Arduino ATMega 1280, a MightyBoard v2.4 and a ECB 3.6, commanded by the software ReplicatorG 0040 with the driver : Thingomatic w/HBP and Stepstruder MK7. Since this set up is quite old and I recently had to change to a McBook Pro 15' from 2017.. I had some problems with the drivers, if you have a Mac Os Sierra 10.9 or older you migth need to download:

    - the latest Arduino Drivers (on 15/05/18 I downloaded Arduino-1.8.5.McOsx.zip https://downloads.arduino.cc/arduino-1.8.5-macosx.zip)
    - FTDIUSBSerialDriver_v2_4_2.dmg http://www.ftdichip.com/Drivers/VCP/MacOSX/FTDIUSBSerialDriver_v2_4_2.dmg
    - and (in my case I was told that the Arduino ATMega 1280 was probably not Original...)you migth need this new drivers (on 15/05/18 I downloaded this from Adrian Mihalko's github https://github.com/adrianmihalko/ch340g-ch34g-ch34x-mac-os-x-driver/blob/master/CH34x_Install_V1.4.zip )
    NOTE: If you wanna give a try with Sailfish Installer http://www.sailfishfirmware.com/doc/install.html

START REPLICATOR
OPEN 
CALIBRATE: File/Scripts/Calibration/Thing-o-matic_calibration.gcode
CHOOSE MACHINE Type (driver): Thingomatic w/HBP and Stepstruder MK7
CHOOSE YOU USB PORT: /dev/tty/usb.serial-A600euUF (in my case, but can change in your case, you can check this opening you Arduino, open ports)
PRESS CONNECT 
OPEN (your date).gcode
PRESS BUILD

SEE THE MAGIC https://vlorenzolana.myportfolio.com/bioprinter


