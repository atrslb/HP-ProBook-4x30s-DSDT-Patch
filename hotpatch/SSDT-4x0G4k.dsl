// SSDT for ProBook 4x0 G4 (Kabylake)

DefinitionBlock("", "SSDT", 2, "hack", "_4x0G4k", 0)
{
    #define OVERRIDE_XPEE 1
    #include "SSDT-RMCF.asl"
    #include "SSDT-RP01_PXSX_RDSS.asl"
    #include "SSDT-HACK.asl"
    #include "include/layout20_HDEF.asl"
    #include "include/disable_HECI.asl"
    #include "include/key86_PS2K.asl"
    #include "SSDT-KEY87.asl"
    #include "SSDT-USB-4x0-G4.asl"
    #include "SSDT-XHC.asl"
    #include "SSDT-BATT-G4.asl"
    #include "SSDT-USBX.asl"
    #include "SSDT-ALS0.asl"

    // This USWE code is specific to the Skylake G3
    External(USWE, FieldUnitObj)
    Device(RMD3)
    {
        Name(_HID, "RMD30000")
        Method(_INI)
        {
            // disable wake on XHC (XHC._PRW checks USWE and enables wake if it is 1)
            If (CondRefOf(\USWE)) { \USWE = 0 }
        }
    }
}
//EOF
